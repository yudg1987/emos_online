<template>
	<view>
		<view class="head">
			<view class="search">
				<view style="display: inline; width: 90%;">
					<input class="search-word" placeholder="搜索" @confirm='search' v-model="key" @input="clearResult()"></view>
	
				<view class="option" @click="cancle">{{optitle}}</view>
			</view>
		</view>
		<uni-list>
			<uni-list-item v-for="(one,index) in result"   :show-badge="true" :badge-text="one.lawSegments.length" :title="one.title" :note="one.state" :showArrow='true' clickable @click="onClick(one)" :key="index">
			  <view>{{one.effectLevel}}</view>
			</uni-list-item>
		</uni-list>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				key:'',
				result:[],
				totalPage: 0
			}
		},
		onShow:function(option){
			console.log('onShow法律法规加载'+this.url.getLaw)
		},
		methods: {
			search:function(option) {
				//console.log('search...'+this);
				let data=this.lawData
				data.text = this.key
				console.log('data:'+JSON.stringify(data))
				this.ajax(this.url.getLaw,'POST',data,(res) => {
					this.totalPage= res.data.returnData.total
					//console.log('result',JSON.stringify(res.data.returnData.list));
					this.result=[...this.result,...res.data.returnData.list]
				})
			},
			onClick:function(one){
				console.log('onClick..',JSON.stringify(one))
				uni.navigateTo({
					url:"./law-detail?one="+JSON.stringify(one)
				})
			},
			clearResult(){
				this.result=[]
				this.totalPage=0
				this.lawData.page.pageNo=1
			}
		},
		onReachBottom:function(){
			console.log('onReachBottom',this.lawData.page.pageNo,this.totalPage)
			if(this.lawData.page.pageNo <= this.totalPage){
				this.lawData.page.pageNo++
				this.search()
				console.log(this.result.length)
			}else{
				console.log('到达最后一页了',this.totalPage)
			}
		}
	}
</script>

<style>
	.head {
		padding: 30rpx 30rpx;
		background-color: #F6F6F6;
	}
	
	.search {
	
		background-image: url(http://106.13.6.212:8888/group1/M00/00/01/wKgABGJ2ZruABrgOAAAHfnUq6c4502_big.png) no-repeat 0 center;
		height: 60rpx;
		border: 1px solid #EEEEEE;
		color: #BDBDBD;
		background-color: #FFFFFF;
		width: 90%;
		border-radius: 8px;
	}
	
	.search-word {
		display: inline;
		float: left;
		height: 60rpx;
	
		margin-left: 60rpx;
	}
	
	.icon {
		margin-left: 10rpx;
		margin-right: 20rpx;
		width: 40rpx;
		display: inline;
	}
	
	.option {
		display: inline;
		position: absolute;
		right: 10rpx;
		height: 60rpx;
		color: @background-color;
		vertical-align: middle;
	}
</style>
