<template>
	<view class="page">

		<uni-list>
			<uni-list-chat  avatarCircle="true" v-for="(one,index) in list"  :title="one.senderName" :avatar="one.senderPhoto" :note="one.msg" badgePositon="left"
			 :badge-text="one.readFlag ? '' : 'dot'" :key="one.id" link="navigateTo" :to="'../message_detail/message_detail?id=' + one.id + '&readFlag=' + one.readFlag + '&refId=' + one.refId">
				<view class="chat-custom-right">
					<text class="chat-custom-text">{{ one.sendTime }}</text>
				</view>
			</uni-list-chat>
		</uni-list>
	</view>
</template>

<script>
	import uniList from '@/components/uni-list/uni-list.vue';
	import uniListItem from '@/components/uni-list-item/uni-list-item.vue';
	export default {
		components: {
			uniList,
			uniListItem
		},
		data() {
			return {

				page: 1,
				length: 20,
				list: [],
				isLastPage: false
			}
		},
		onShow:function(){
			let that = this
			that.page = 1
			that.isLastPage = false
			uni.pageScrollTo({
				scrollTop:'0'
			})
			that.loadMessageList(this)
		},
		onReachBottom:function(){
			if(this.isLastPage) return
			this.page ++
			this.loadMessageList(this)
		},
		methods: {

			loadMessageList: function(ref) {
				var that = ref
				let data = {
					page: that.page,
					length: that.length
				}
				ref.ajax(that.url.searchMessageByPage, 'POST', data, function(resp) {
					let result= resp.data.result
					console.log('----result---',JSON.stringify(result))
					if (result == null || result.length == 0) {
						console.log('----result---1111')
						ref.isLastPage = true;
						ref.page = ref.page -1
						
						uni.showToast({
							icon:'none',
							title:'已经到底了'
						});
					}else{
						if(ref.page ==1){
							console.log('----result---2222')
							ref.list = []
						}
						ref.list = ref.list.concat(result)
						console.log('----ref.list---',JSON.stringify(ref.list))
						if(ref.page > 1){
							console.log('----result---33333333')
							uni.showToast({
								icon:'none',
								title:'又加载了'+result.length+'条消息'
							})
						}
					}

				})

			}
		}
	}
</script>


<style lang="less">
	@import url('message_list.less');
</style>
