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
		<view v-if="lastPage" class="isOver">------------这里是底部------------</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				key:'',
				result:[],
				lastPage:false
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
					this.lastPage= resp.data.returnData.lastPage
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
				this.lastPage=false
				this.lawData.page.pageNo=1
			}
		},
		onReachBottom:function(){
			console.log('onReachBottom',this.lawData.page.pageNo,this.lastPage)
			if(!this.lastPage){
				this.lawData.page.pageNo++
				this.search(false)
				console.log(this.result.length)
			}else{
				console.log('到达最后一页了',this.lastPage)
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
