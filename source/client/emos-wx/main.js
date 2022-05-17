import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false
//var baseUrl = "http://localhost:996/emos-wx-api"
var baseUrl = "http://124.221.192.169:996/emos-wx-api"

// QQ地图定位申请的key 
Vue.prototype.config = {
	qqMapSdkKey: 'ZBABZ-S5LKO-AQAWR-SNHUD-V3AQS-MSBMB'
}

Vue.prototype.url = {
	documentBaseUrl:'https://zhbg-1311765227.cos.ap-nanjing.myqcloud.com/',
	reigster: baseUrl + '/user/register',
	login: baseUrl + '/user/login',
	updateUserInfo: baseUrl + '/user/updateUserInfo',
	checkin: baseUrl + '/checkin/checkin',
	createFaceModel: baseUrl + '/checkin/createFaceModel',
	validCanCheckin: baseUrl + '/checkin/validCanCheckin',
	searchTodayCheckin: baseUrl + '/checkin/searchTodayCheckin',
	searchUserSummary: baseUrl + '/user/searchUserSummary',
	checkRegisterCode: baseUrl + '/user/checkRegisterCode',
	searchMonthCheckin: baseUrl + '/checkin/searchMonthCheckin',
	refreshMessage: baseUrl + '/message/refreshMessage',
	searchMessageByPage: baseUrl + '/message/searchMessageByPage',
	searchMessageById: baseUrl + '/message/searchMessageById',
	updateUnreadMessage: baseUrl + '/message/updateUnreadMessage',
	deleteMessageRefById: baseUrl + '/message/deleteMessageRefById',
	emplyeeList: baseUrl + '/user/contactList',
	employeeSearch: baseUrl + '/employee/employeeSearch',
	documentList: baseUrl + '/document/filelist',
	searchMeetingListByPage: baseUrl + '/meeting/searchMeetingListByPage',
	searchUserGroupByDept: baseUrl + '/user/searchUserGroupByDept',
	searchMembers: baseUrl + '/user/searchMembers',
	searchUserById:baseUrl+'/user/searchUserById',
	insertMeeting: baseUrl + '/meeting/insertMeeting',
	searchMeetingById: baseUrl + '/meeting/searchMeetingById',
	updateMeetingInfo: baseUrl + '/meeting/updateMeetingInfo',
	deleteMeetingById: baseUrl + '/meeting/deleteMeetingById',
	selectUserPhotoAndName: baseUrl + '/user/selectUserPhotoAndName',
	searchUserMeetingInMonth: baseUrl + '/meeting/searchUserMeetingInMonth',
	approvalMeeting: baseUrl + '/meetingApproval/approvalMeeting',
	searchMeetingNeedApproval: baseUrl + '/meetingApproval/searchNeedApproval',
	searchMeetingAlreadyApproval: baseUrl + '/meetingApproval/searchAlreadyApproval',
	searchRoleOwnPermission: baseUrl + '/role/searchRoleOwnPermission',
	searchAllPermission: baseUrl + '/role/searchAllPermission',
	insertRole: baseUrl + '/role/insertRole',
	deleteRole: baseUrl + '/role/deleteRole',
	updateRolePermissions: baseUrl + '/role/updateRolePermissions',
	searAllRoles: baseUrl + '/role/searAllRoles',
	searchAllDepts: baseUrl + '/dept/searchAllDepts',
	insertDept: baseUrl + '/dept/insertDept',
	updateDept: baseUrl + '/dept/updateDept',
	deleteDept: baseUrl + '/dept/deleteDept',
	riskAtLocation: baseUrl + '/healthy/riskAtLocation',
	getRiskCheckCount: baseUrl + '/healthy/getRiskCheckCount',
	insertEmployee: baseUrl + '/employee/insertEmployee',
	searchUnActiveEmployees: baseUrl + '/employee/searchUnActiveEmployees',
	updateEmployeeInfo: baseUrl + '/employee/updateEmployee',
	updateEmployeeState: baseUrl + '/employee/updateState',
	searchEmployee: baseUrl + '/employee/searchEmployee',
	deleteEmployee: baseUrl+'/employee/deleteEmployee',
	dimissionEmployee:baseUrl+'/user/dimissionEmployee',
	getLaw: 'https://t.lawsdata.com/api/compass-front/openApi/miniProgram/law',
	getinstrument:'https://t.lawsdata.com/api/compass-front/openApi/miniProgram/instrument',
	searchMyMeetingListByPage: baseUrl+'/meeting/searchMeetingListByPage',
	uploadFile: baseUrl+'/file/common/upload'
}
// 法律法规 案例查询咨询参数
Vue.prototype.lawData = {
	appId: '8',
	key: '5p66IO95rOV5b6L5pyN5Yqh5bmz5Y+w',
	page:{
		 pageNo: 1,
		 pageSize: 10
	}
}


Vue.prototype.ajax = function(url, method, data, func) {
	console.log(data)
	uni.request({
		'url': url,
		'method': method,
		'header': {
			token: uni.getStorageSync('token')
		},
		'data': data,
		success: function(resp) {
			//console.log('ajax请求成功'+JSON.stringify(resp));

			console.log('11111:' + resp.statusCode + "__" + (resp.data.code||resp.data.returnCode))
			if (resp.statusCode == 401) {
                console.log('401了:')
				uni.redirectTo({
					url: '../login/login'
				});
			} else if (resp.statusCode == 200 && (resp.data.code == 200 || resp.data.returnCode == 200)) {
				console.log('200-1了:')
				let data = resp.data
				if (data.hasOwnProperty('token')) {

					console.log(resp.data)
					let token = data.token
					uni.setStorageSync('token', token)
					console.log('save token:' + token)
				}
				func(resp)
			} else {
				uni.showToast({
					icon: 'none',
					title: resp.data.msg||resp.data.returnInfo
				})

			}

		}
	});
}

Vue.prototype.checkPermission = function(permissions) {
	let user_permisson = uni.getStorageSync("permission")
	let result = false

	for (let perm of permissions) {
		if (user_permisson.indexOf(perm) != -1) {
			result = true;
			break;
		}
	}
	return result;
}
Date.prototype.format = function(fmt) {
	var o = {
		"M+": this.getMonth() + 1, //月份 
		"d+": this.getDate(), //日 
		"h+": this.getHours(), //小时 
		"m+": this.getMinutes(), //分 
		"s+": this.getSeconds(), //秒 
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		"S": this.getMilliseconds() //毫秒 
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}

Vue.prototype.checkNull = function(data, name) {
	if (data == null) {
		uni.showToast({
			icon: "none",
			title: name + "不能为空"
		})
		return true
	}
	return false
}
Vue.prototype.checkBlank = function(data, name) {
	if (data == null || data == "") {
		uni.showToast({
			icon: "none",
			title: name + "不能为空"
		})
		return true
	}
	return false
}
Vue.prototype.checkValidName = function(data, name) {
	if (data == null || data == "") {
		uni.showToast({
			icon: "none",
			title: name + "不能为空"
		})
		return true
	} else if (!/^[\u4e00-\u9fa5]{2,15}$/.test(data)) {
		uni.showToast({
			icon: "none",
			title: name + "内容不正确"
		})
		return true
	}
	return false
}
Vue.prototype.checkValidTel = function(data, name) {
	if (data == null || data == "") {
		uni.showToast({
			icon: "none",
			title: name + "不能为空"
		})
		return true
	} else if (!/^1[0-9]{10}$/.test(data)) {
		uni.showToast({
			icon: "none",
			title: name + "内容不正确"
		})
		return true
	}
	return false
}
Vue.prototype.checkValidEmail = function(data, name) {
	if (data == null || data == "") {
		uni.showToast({
			icon: "none",
			title: name + "不能为空"
		})
		return true
	} else if (!/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/.test(data)) {
		uni.showToast({
			icon: "none",
			title: name + "内容不正确"
		})
		return true
	}
	return false
}
Vue.prototype.checkValidStartAndEnd = function(start, end) {
	let d1 = new Date("2000/01/01 " + start + ":00");
	let d2 = new Date("2000/01/01 " + end + ":00");
	if (d2.getTime() <= d1.getTime()) {
		uni.showToast({
			icon: "none",
			title: "结束时间必须大于开始时间"
		})
		return true
	}
	return false
}

App.mpType = 'app'

const app = new Vue({
	...App
})
app.$mount()
