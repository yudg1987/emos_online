<template>
	 <view class="page">
		 <view class="detail">
		 	 		<view>
		 	 			<text class="head">法规基本信息</text>
		 	 			<view class="item">
		 	 				<view class="left">
		 	 					<view class="title">{{one.title}}</view>
		 	 					<view class="des">标题</view>
		 	 				</view>
		 	 			</view>
		 	 			<view class="item">
		 	 				<view class="left">
		 	 					<view class="title">{{one.province == null ?'':one.province}}</view>
		 	 					<view class="des">省份</view>
		 	 				</view>
		 	 				<image class="icon" src="" mode="widthFix"></image>
		 	 			</view>
		 	 			<view class="item">
		 	 				<view class="left">
		 	 					<view class="title">{{one.lawNo}}</view>
		 	 					<view class="des">发文编号</view>
		 	 				</view>
		 	 				<image class="icon" src="." mode="widthFix"></image>
		 	 			</view>
		 				
		 				<view class="item">
		 					<view class="left">
		 						<view class="title">{{one.pubDate}}</view>
		 						<view class="des">公布日期</view>
		 					</view>
		 					<image class="icon" src="." mode="widthFix"></image>
		 				</view>
		 				
		 				<view class="item">
		 					<view class="left">
		 						<view class="title">{{one.effectiveDate}}</view>
		 						<view class="des">生效日期</view>
		 					</view>
		 					<image class="icon" src="." mode="widthFix"></image>
		 				</view>
		 				
		 				<view class="item">
		 					<view class="left">
		 						<view class="title">{{one.state}}</view>
		 						<view class="des">有效性</view>
		 					</view>
		 					<image class="icon" src="." mode="widthFix"></image>
		 				</view>
		 				
		 				<view class="item">
		 					<view class="left">
		 						<view class="title">{{one.org}}</view>
		 						<view class="des">发文机构</view>
		 					</view>
		 					<image class="icon" src="." mode="widthFix"></image>
		 				</view>
		 				
		 				<view class="item">
		 					<view class="left">
		 						<view class="title">{{one.effectLevel}}</view>
		 						<view class="des">效力级别</view>
		 					</view>
		 					<image class="icon" src="." mode="widthFix"></image>
		 				</view>
		 	 		</view>
					<text class="head">*法规条目信息*</text>
					<uni-list>
						<uni-list-item v-for="(one,index) in one.lawSegments"  :title="one.text" :note="one.location" clickable="false" :key="index">
						  <view>{{one.effectLevel}}</view>
						</uni-list-item>
					</uni-list>
			
		 	 	</view>
	 </view>
</template>

<script>
	export default{
		data(){
			return {
				one:{}
			}
		},
		onLoad:function(option){
			//console.log('lawSegments',JSON.stringify(option.one))
			this.one=JSON.parse(option.one);
		}
	}
</script>

<style>
	.icon {
			width: 50rpx;
			position: absolute;
			right: 30rpx;
			vertical-align: middle;
		}
	
		.title {
			color: @font-color;
			font-size: 36rpx;
		}
	
		.name {
			padding: 30rpx;
			font-size: 40rpx;
		}
	
		.des {
			margin-top: 10rpx;
			color: @desc-color;
			margin-bottom: 20rpx;
		}
	
		.left {
			display: inline-block;
	
		}
	
		.item {
			background-color: #FFFFFF;
			margin: 30rpx;
			border-bottom: 1rpx solid #F2F2F2;
		}
	
		.head {
			display: block;
			padding: 30rpx;
			color: #ff0000;
			background-color: #F6F6F6;
			text-align: center;
		}
</style>