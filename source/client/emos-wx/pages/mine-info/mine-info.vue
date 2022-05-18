<!-- 个人信息界面 -->
<template>
	<view class="page">
		<view class="info_list" @click="chooseImage">
				<view class="label">头像(点击更换)</view>
				<view>
					<!-- <view>头像</view> -->
					<image :src="user.photo" class="photo" mode="aspectFit"></image>
					<uni-icons type="arrowright" size="5" color="#A4A4A4"></uni-icons>
				</view>	
		</view>        
		<uni-list>
			<!-- <uni-list-item title="头像" ></uni-list-item> -->
			<!-- 显示圆形头像 -->
			<!-- <uni-list-chat :avatar-circle="true" title="头像" :avatar="user.photo"></uni-list-chat> -->
			<!-- <uni-list-item title="头像" @click="editName" link>
					<image :src="user.photo" mode=""></image>
					<uni-icons type="arrowright" size="18" color="#A4A4A4"></uni-icons>
			</uni-list-item> -->
			<uni-list-item title="姓名" @click="editName" link :rightText="user.name"></uni-list-item>
			<uni-list-item title="部门" :rightText="user.deptName"></uni-list-item>
			<uni-list-item title="手机" link @click="editTel" :rightText="user.tel"></uni-list-item>
			<uni-list-item title="邮箱" :rightText="user.email"></uni-list-item>
		</uni-list>
        <view class="progress-box">
			<!-- <progress :percent="percent" stroke-width="3" /> -->
			<!-- <uni-icons type="close" class="progress-cancel" color="#dd524d"></uni-icons> -->
			<!-- <progress :percent="percent" stroke-width="10"></progress> -->
        </view>
		<uni-popup ref="popupName" type="dialog">
			<uni-popup-dialog mode="input" title="编辑名字" :value="user.name" placeholder="输入姓名" @confirm="finishName"></uni-popup-dialog>
		</uni-popup>
		<uni-popup ref="popupTel" type="dialog">
			<uni-popup-dialog mode="input" title="编辑手机号" :value="user.tel" placeholder="输入手机号" @confirm="finishTel"></uni-popup-dialog>
		</uni-popup>
		<progress :percent="percent" stroke-width="10" v-if="showProgress"></progress>
	</view>
</template>

<script>
	import uniList from '../../components/uni-list/uni-list.vue';
	import uniListItem from '../../components/uni-list-item/uni-list-item.vue';
	import uniPopup from '@/components/uni-popup/uni-popup.vue';
	import uniPopupMessage from '@/components/uni-popup/uni-popup-message.vue';
	import uniPopupDialog from '@/components/uni-popup/uni-popup-dialog.vue';
	export default {
		components: {
			uniPopup,
			uniPopupMessage,
			uniPopupDialog,
			uniList,
			uniListItem
		},
		data() {
			return {
				user: {
					name: '',
					deptName: '研发部',
					tel: '18888888888',
					email: '',
					photo: ''

				},
				showProgress:false,
				percent : 0
			}
		},
		onShow: function() {
			this.getUserInfo()
		},
		methods: {

			getUserInfo: function() {
				let that = this
				that.ajax(that.url.searchUserSummary, 'GET', null, function(resp) {

					that.user = resp.data.result
					//that.name = result.name
					//that.deptName = result.deptName
					//that.photo = result.photo

					console.log(that.photo)

				})
			},
			editTel: function() {
				this.$refs.popupTel.open()
			},
			editName: function() {
				this.$refs.popupName.open()
			},
			finishName: function(done, value) {

				let that = this
				if (value != null && value != '') {
					that.user.name = value
					done()
					that.updateUserInfo()
				} else {
					uni.showToast({
						icon: 'none',
						title: '姓名不能为空'
					})
				}

			},
			finishTel: function(done, value) {

				let that = this
				if (value != null && value != '') {
					this.user.tel = value
					done()
					that.updateUserInfo()


				} else {
					uni.showToast({
						icon: 'none',
						title: '手机号不能为空'
					})
				}

			},
			updateUserInfo: function() {
				uni.showLoading({
					title: '请稍后...'
				})
				let that = this
				that.ajax(that.url.updateUserInfo, 'POST', {
					'name': that.user.name,
					'tel': that.user.tel,
					'email': that.user.email,
					'photo': that.user.photo
				}, function(resp) {
					
					uni.showToast({
						icon: 'none',
						title: '操作成功'
					})
					uni.hideLoading()
					that.getUserInfo()
				})
			},
            
			chooseImage(){
				console.log('chooseImage')
				uni.chooseImage({
					count:1,
					sizeType: ['original', 'compressed'],
					success: (res) => {
						this.showProgress=true
						const tempFilePaths =res.tempFilePaths//图片临时数组
						console.log(tempFilePaths)
						const uploadTask = uni.uploadFile({
						    //请求的url接口地址
							url: this.url.uploadFile,
							//formData:{
								//请求中接口额外的参数
							//	id:'1385048044696801281'
							//},
							fileType:'image',//图片类型
							filePath:tempFilePaths[0],//哪张图片
							name:'file',//对应接口的文件名称
							header:{//请求头
								"Content-Type": "multipart/form-data",
								"token": uni.getStorageSync('token')
							},
							success:(uploadFileRes)=>{
							    //成功的回调
								//一般用于重新获取数据渲染页面
								//console.log(res1)
								let imgData = JSON.parse(uploadFileRes.data)												
								console.log('uploadFileRes.data='+uploadFileRes.data)
								console.log('imgData.fullPath='+imgData.fullPath)
								this.user.photo=imgData.fullPath
								this.showProgress=false
								this.updateUserInfo()								
							},
							fail:(err)=>{
							//失败的回调
								console.log(err)
								this.showProgress=false
							}
						});
						//上传进度的监听
						uploadTask.onProgressUpdate((progress) => {
									console.log('上传进度' + progress.progress);
									console.log('已经上传的数据长度' + progress.totalBytesSent);
									console.log('预期需要上传的数据总长度' + progress.totalBytesExpectedToSend);	
									this.percent= progress.progress
									console.log('percent='+this.percent)
									// 测试条件，取消上传任务。
									/* if (res.progress > 50) {
										uploadTask.abort();
									} */
						});
					}
				})
			}
			
		}
	}
</script>

<style lang="less">
	@import url('mine-info.less');
	.progress-box {
			display: flex;
			height: 50rpx;
			margin-bottom: 60rpx;
	}
	.uni-icon {
		line-height: 1.5;
	}

	.progress-cancel {
		margin-left: 40rpx;
	}

	.progress-control button {
		margin-top: 20rpx;
	}
</style>
