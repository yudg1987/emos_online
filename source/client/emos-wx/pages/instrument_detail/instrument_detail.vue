<template>
	<view class="page">
			 <view class="detail">
			 	 		<view>
			 	 			<text class="head">案例基本信息</text>
			 	 			<view class="item">
			 	 				<view class="left">
			 	 					<view class="title">{{one.caseTitle}}</view>
			 	 					<view class="des">案件名称</view>
			 	 				</view>
			 	 			</view>
			 	 			<view class="item">
			 	 				<view class="left">
			 	 					<view class="title">{{one.referencedType == null ?'':one.referencedType}}</view>
			 	 					<view class="des">参考类型</view>
			 	 				</view>
			 	 				<image class="icon" src="" mode="widthFix"></image>
			 	 			</view>
			 	 			<view class="item">
			 	 				<view class="left">
			 	 					<view class="title">{{one.caseNo}}</view>
			 	 					<view class="des">案号</view>
			 	 				</view>
			 	 				<image class="icon" src="." mode="widthFix"></image>
			 	 			</view>
			 				
			 				<view class="item">
			 					<view class="left">
			 						<view class="title">{{one.instrumentType}}</view>
			 						<view class="des">文书类型</view>
			 					</view>
			 					<image class="icon" src="." mode="widthFix"></image>
			 				</view>
			 				
			 				<view class="item">
			 					<view class="left">
			 						<view class="title">{{one.procedure}}</view>
			 						<view class="des">审理程序</view>
			 					</view>
			 					<image class="icon" src="." mode="widthFix"></image>
			 				</view>
			 				
			 				<view class="item">
			 					<view class="left">
			 						<view class="title">{{one.reason}}</view>
			 						<view class="des">案由</view>
			 					</view>
			 					<image class="icon" src="." mode="widthFix"></image>
			 				</view>
			 				
			 				<view class="item">
			 					<view class="left">
			 						<view class="title">{{one.court}}</view>
			 						<view class="des">法院</view>
			 					</view>
			 					<image class="icon" src="." mode="widthFix"></image>
			 				</view>
			 				
			 				<view class="item">
			 					<view class="left">
			 						<view class="title">{{one.judgementDate}}</view>
			 						<view class="des">裁判日期</view>
			 					</view>
			 					<image class="icon" src="." mode="widthFix"></image>
			 				</view>
							
							<view class="item">
								<view class="left">
									<view class="title">{{one.caseType}}</view>
									<view class="des">案件类型</view>
								</view>
								<image class="icon" src="." mode="widthFix"></image>
							</view>
			 	 		</view>
						<text class="head">*案件信息*</text>
						<uni-list>
							<uni-list-item v-for="(one,index) in one.segments"  :title="one.text" :note="one.location" clickable="false" :key="index">
							  <view>{{one.typeText}}</view>
							</uni-list-item>
						</uni-list>
				
			 	 	</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				one:{}
			}
		},
		methods: {
			
		},
		
		onLoad:function(option){
			this.one=JSON.parse(option.one)
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
