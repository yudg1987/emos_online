<template>
	<view class="page">
		<image src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZVGASd5jAADYcT-rdME478_big.jpg" mode="widthFix" class="logo"></image>
		<view class="add" v-if="checkPermission(['ROOT','MEETING:INSERT'])" @tap="toMeetingDetail(null,'insert')">
			<image src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZXmAGZ5NAAAFLVIPBRs961_big.png" mode="widthFix" class="icon"></image>
			<text>创建会议</text>
		</view>
		<view v-for="one in list" :key="one.date">
			<view class="list-title">{{ one.date }}</view>
			<view class="item" v-for="meeting in one.list" :key="meeting.id" @longpress="deleteById(meeting.id,meeting.date,meeting.start)">
				<view class="header">
					<view class="left">
						<image v-if="meeting.type == '线上会议'" src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZZqALq4oAAAFhumzjVw616_big.png" mode="widthFix" class="icon"></image>
						<image v-if="meeting.type == '线下会议'" src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZeKAEXY3AAAJEIBBceY668_big.png" mode="widthFix" class="icon"></image>
						<text>{{ meeting.type }}</text>
						<text :class="meeting.status == '未开始' ? 'blue' : 'red'">（{{ meeting.status }}）</text>
					</view>
					<view class="right" @tap="toMeetingDetail(meeting.id, 'edit')" v-if="checkPermission(['ROOT', 'MEETING:UPDATE']) && meeting.status == '未开始'">
						<text>编辑</text>
					</view>
				</view>
				<view class="content">
					<view class="title">{{ meeting.title }}</view>
					<view class="attr">
						<view class="timer">
							<image src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2Zg2AIpcvAAAPGoa0fGk507_big.png" mode="widthFix" class="icon"></image>
							<text>{{ meeting.start }} ~ {{ meeting.end }}</text>
						</view>
						<view class="creator">
							<image src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZimAVwhMAAAO67ASu2Y623_big.png" mode="widthFix" class="icon"></image>
							<text>{{ meeting.name }}</text>
						</view>
						<view class="place" v-if="meeting.type == '线下会议'">
							<image src="http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2Zj6AA52CAAAE7cTCVxo353_big.png" mode="widthFix" class="icon"></image>
							<text>{{ meeting.place }}</text>
						</view>
					</view>
					<view class="desc">{{ meeting.desc }}</view>
					<button class="btn" v-if="meeting.type == '线上会议'">进入</button>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				page: 1,
				length: 20,
				list: [],
				isLastPage: false
			}
		},

		methods: {

			deleteById: function(id, date, start) {
				console.log(`====`)
				let now = new Date()
				let meetingDate = new Date(date + +' ' + start + ':00')
				//会议开始前20分钟不能取消
				if (now.getTime() >= meetingDate.getTime() - 20 * 60 * 1000) {
					uni.showToast({
						title: '该会议无法删除',
						icon: 'none'
					});
					return;
				}
				let that = this;
				uni.vibrateShort({});
				uni.showModal({
					title: '提示信息',
					content: '是否删除这个会议？',
					success: function(resp) {
						if (resp.confirm) {
							let data = {
								id: id
							};
							that.ajax(that.url.deleteMeetingById, 'POST', data, function(resp) {
								uni.showToast({
									icon: 'success',
									title: '删除成功',
									complete: function() {
										setTimeout(function() {
											that.page = 1;
											that.isLastPage = false;
											uni.pageScrollTo({
												scrollTop: '0'
											});
											that.list = []
											that.loadMeetingList(that);
										}, 2000);
									}
								});
							});
						}
					}
				});
			},
			createMeeting: function() {
				uni.navigateTo({
					url: '../meeting/meeting'
				})
			},
			toMeetingDetail: function(id, opt) {
				uni.navigateTo({
					url: '../meeting/meeting?id=' + id + '&opt=' + opt
				})
			},
			loadMeetingList: function(ref) {
				let data = {
					page: ref.page,
					length: ref.length
				};
				ref.ajax(ref.url.searchMeetingListByPage, 'POST', data, function(resp) {
					let result = resp.data.result;
					if (result == null || result.length == 0) {
						ref.isLastPage = true;
						ref.page = ref.page - 1;
						if (ref.page > 1) {
							uni.showToast({
								icon: 'none',
								title: '已经到底了'
							});
						}
					} else {
						for (let one of result) {
							for (let meeting of one.list) {
								if (meeting.type == 1) {
									meeting.type = '线上会议';
								} else if (meeting.type == 2) {
									meeting.type = '线下会议';
								}
								if (meeting.status == 3) {
									meeting.status = '未开始';
								} else if (meeting.status == 4) {
									meeting.status = '进行中';
								} else if (meeting.status == 5) {
									meeting.status = '已结束';
								}
							}
							if (ref.list.length > 0) {
								let last = ref.list[ref.list.length - 1];
								if (last.date == one.date) {
									last.list = last.list.concat(one.list);
								} else {
									ref.list.push(one);
								}
							} else {
								ref.list.push(one);
							}
						}
					}
				});
			},
		},
		onReachBottom: function() {
			let that = this;
			if (that.isLastPage) {
				return;
			}
			that.page = that.page + 1;
			that.loadMeetingList(that);
		},
		onShow: function() {
			let that = this;
			that.page = 1;
			that.isLastPage = false;
			that.list = [];
			that.loadMeetingList(that);
		},
	}
</script>

<style lang="less">
	@import url('metting_list.less');
</style>
