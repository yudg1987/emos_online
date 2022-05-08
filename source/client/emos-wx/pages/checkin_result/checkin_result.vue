<template>
	<view class="page">
		<view class="summary-container">
			<view class="user-info">
				<image class="avatar" :src="avatar" mode="widthFix"></image>
				<view class="info">
					<text class="name">{{name}}</text>
					<text class="dept">隶属部门：{{deptName == null?'无':deptName}}</text>
				</view>
				<view class="date">
					{{date}}
				</view>
			</view>
		</view>
		<view class="result-container">
			<view class="left">
				<image class="icon-timer" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y3uAQINQAAAMkT5t9zQ047_big.png" mode="widthFix"></image>
				<image class="icon-timer" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y3uAQINQAAAMkT5t9zQ047_big.png" mode="widthFix"></image>
				<view class="line">

				</view>
			</view>
			<view class="right">
				<view class="row">
					<text class="start">上班(时间{{attendanceTime}})</text>
				</view>
				<view class="row">
					<text class="checkin-time">签到时间({{checkinTime}})</text>
					<text class="checkin-result other green" v-if="status=='正常'">{{status}}</text>
					<text class="checkin-result other yellow" v-if="status=='迟到'">{{status}}</text>
				</view>
				<view class="row">

					<image class="icon-small" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y6qAUsUoAAAIb_AylxM377_big.png" mode="widthFix"></image>
					<text class="desc">{{address}}</text>
					<text class="checkin-result other green" v-if="risk=='低风险'">{{risk}}</text>
					<text class="checkin-result other yellow" v-if="risk=='中风险'">{{risk}}</text>
					<text class="checkin-result other red" v-if="risk=='高风险'">{{risk}}</text>
				</view>
				<view class="row">
					<image class="icon-small" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y8OAZnf-AAAErW4-O6A587_big.png" mode="widthFix"></image>
					<text class="desc">身份验证</text>
					<text class="checkin-result green">已通过</text>
				</view>
				<view class="row">
					<text class="end">下班(时间{{closingTime}})</text>
				</view>
			</view>
		</view>
		<view class="checkin-report">
			<image class="big-icon" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y9-ASOM1AAEI4MK_ziQ408_big.png" mode="widthFix"></image>
			<view class="report-title">
				<text class="days">{{checkinDays}}</text>
				<text class="unit">天</text>
			</view>
			<view class="sub-title">
				<text>累计签到</text>
				<view class="line">
				</view>
			</view>
			<view class="calendar-container">
				<view class="calendar" v-for="(one,index) in weekCheckin" :key="index">
					<image class="calendar-icon" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2Y_eAYrh_AAAEicfJ9SA880_big.png" v-if="one.type != '节假日'" mode="widthFix"></image>
					<image class="calendar-icon" src="http://106.13.6.212:8888/group1/M00/00/00/wKgABGJ2ZAmAYG_YAAAEWjSGZeM207_big.png" v-if="one.type == '节假日'" mode="widthFix"></image>
					<text class="day">{{one.day}}</text>
					<text class="result green" v-if="one.status=='正常'">正常</text>
					<text class="result yellow" v-if="one.status=='迟到'">迟到</text>
					<text class="result red" v-if="one.status=='缺勤'">缺勤</text>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				name: "",
				avatar: "",
				deptName: "",
				address: "",
				status: "",
				risk: "",
				checkinTime: "",
				date: "",
				attendanceTime: "",
				closingTime: "",
				checkinDays: 0,
				weekCheckin: [
				]
			}
		},
		methods: {

		},
		onShow: function() {
			let that = this
			that.ajax(that.url.searchTodayCheckin,'GET',null,function(resp){
				
				let result = resp.data.result
				that.name = result.name
				that.avatar = result.photo
				that.deptName = result.deptName
				that.date = result.date
				that.attendanceTime = result.attendanceTime
				that.closingTime = result.closingTime
				that.checkinTime = result.checkinTime
				that.status = result.status
				that.riskt = result.risk
				that.address = result.address
				that.checkinDays = result.checkinDays
				that.weekCheckin = result.weekCheckin
			})
		}
	}
</script>

<style lang="less">
	@import url("checkin_result.less");
</style>
