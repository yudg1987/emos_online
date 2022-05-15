<template>
	<view>
		<view class="search">
			<input type="text" placeholder="输入案例" v-model="key">
		</view>
		<button type="primary" @click="search(true)"  class="searchButton">搜索</button>
		<uni-list>
			<uni-list-item v-for="(one,index) in result"   :show-badge="true" :badge-text="one.segments.length" :title="one.caseTitle" :note="one.caseNo" :showArrow='true' clickable @click="onClick(one)" :key="index">
			  <view>{{one.court}}</view>
			</uni-list-item>
		</uni-list>
		<view v-if="bottom" class="isOver">------------这里是底部------------</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				key:'',
				result:[],
				totalPage: 0,
				bottom:false
			}
		},
		methods: {
			search(flag){
				//按钮重新搜索才清空 下拉触底搜索不清空
				if(flag){
					this.clearResult()
				}
				let data=this.lawData
				console.log('key',this.key)
				data.text=this.key
				this.ajax(this.url.getinstrument, 'POST', data, (resp)=>{
					//console.log('result',JSON.stringify(resp.data.returnData));
					this.totalPage= resp.data.returnData.total
					this.result=[...this.result , ...resp.data.returnData.list]
				})
			},
			onClick:function(one){
				uni.navigateTo({
					url:'../instrument_detail/instrument_detail?one='+JSON.stringify(one)
				})
			},
			clearResult(){
				console.log('clearResult')
				this.result=[]
				this.totalPage=0
				this.lawData.page.pageNo=1
			}
		},
		onReachBottom:function(){
			console.log('onReachBottom',this.lawData.page.pageNo,this.totalPage)
			if(this.lawData.page.pageNo <= this.totalPage){
				this.lawData.page.pageNo++
				this.search(false)
				console.log(this.result.length)
			}else{
				console.log('到达最后一页了',this.totalPage)
				this.bottom=true
			}
		}
		
	}
</script>

<style>
 .search{
	height: 80rpx;
	border: 10px solid #EEEEEE;
	color: #BDBDBD;
	background-color: #FFFFFF;
	width: 90%;
 }
 .searchButton{
	 margin: 10rpx 10rpx !important;
	 border-radius: 8px;
	 
 }
 .isOver{
	 width: 100%;
	 height: 100rpx;
	 line-height: 100rpx;
	 text-align: center;
 }

</style>
