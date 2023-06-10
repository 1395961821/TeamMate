<script>
	import {
		Login
	} from '@/api/user.js'
	import store from '@/utils/store.js'
	import {
		listbyuserid,
	} from '@/api/msg.js'
	export default {
		onLaunch: function() {
			//如果没登录就跳转登录界面
			this.checklogin()
			uni.hideTabBar();
			//定时任务,获取消息
			setInterval(function() {
				if (store.state.token) {
					listbyuserid().then(res => {
						if (res.code == 200) {
							var count = 0;
							for (var i = 0; i < res.data.length; i++) {
								if (res.data[i].state == 0) {
									count += 1;
								}
							}
							store.dispatch('setmsgcount', count)
						}
					})
				}

			}, 5000)
		},
		onLoad() {

		},
		onShow: function() {
			uni.hideTabBar();
			console.log('App Show')
		},
		methods: {
			checklogin() {
				if (!store.state.token) {}
			}
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style lang="scss">
	@import "@/uni_modules/uview-ui/index.scss";

	@font-face {
		font-family: 'MyFont';
		src: url('/static/youshe-webfont.woff2') format('woff2'),
			url('/static/youshe-webfont.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	/deep/ body {
		font-family: 'MyFont', sans-serif;
	}

	.text {
		font-family: 'MyFont', sans-serif;
	}

	page {
		background-color: #161622;
	}

	.container {
		padding-bottom: 190rpx;
	}

	@import '@/globalClass.css';
	// @font-face {
	// 	font-family: 'MyFont';
	// 	src: url('~@/static/youshe.ttf') format('truetype');
	// }
	// @font-face {
	//    font-family: 'MyFont';
	//    src: url('/static/youshe.ttf') format('truetype');
	//  }
</style>