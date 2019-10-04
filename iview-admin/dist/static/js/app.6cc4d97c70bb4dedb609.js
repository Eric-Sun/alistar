webpackJsonp([1],[
/* 0 */,
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var GET_MENU = exports.GET_MENU = "GET_MENU"; //获取菜单
var BREADCRUMB = exports.BREADCRUMB = "BREADCRUMB"; //菜单栏
var USERINFO = exports.USERINFO = "USERINFO"; //用户信息，登陆
var LOGINOUT = exports.LOGINOUT = "LOGINOUT"; //退出登录

var USERLIST = exports.USERLIST = "USERLIST"; //用户列表

var GROUPLIST = exports.GROUPLIST = "GROUPLIST"; //权限列表

var ATTRLIST = exports.ATTRLIST = "ATTRLIST"; //商品属性模板列表
//属性模板当中具体的属性值
var CLASSIFY = exports.CLASSIFY = "CLASSIFY";
//商品列表数据
var GOODSLIST = exports.GOODSLIST = "GOODSLIST";

/***/ }),
/* 2 */,
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.godownUserCreate = exports.godownUserDel = exports.godownUser = exports.godownDel = exports.godownStatus = exports.godownUpdate = exports.godownInfo = exports.godownCreate = exports.godown = exports.refundInfo = exports.refundSure = exports.refund = exports.approval = exports.approvallist = exports.allSellerPayments = exports.allSellerPur = exports.userRefund = exports.userOrders = exports.addOrder = exports.orderInfo = exports.orderCallList = exports.orderLists = exports.addCall = exports.consumerCall = exports.consumerOrderInfo = exports.consumerOrder = exports.consumerInfo = exports.consumer = exports.assistantsAll = exports.sellerSettlement = exports.purchaseInfo = exports.sellerPur = exports.sellerGoods = exports.assistants = exports.area = exports.sellerDel = exports.sellerChange = exports.sellerEdit = exports.sellerInfo = exports.sellerCreate = exports.sellerLists = exports.goodsEdit = exports.goodsInfo = exports.goodsCreate = exports.getGoodsLists = exports.getAttrTempInfo = exports.updateAttrTemp = exports.createAttrTemp = exports.delAttr = exports.changeAttrStatus = exports.getAttrLists = exports.cateDel = exports.cateInfo = exports.cateEdit = exports.cateCreate = exports.getCate = exports.brandInfo = exports.brandEdit = exports.brandCreate = exports.brandDel = exports.brandStat = exports.getBrand = exports.getRule = exports.groupInfo = exports.updateGroup = exports.createGroup = exports.changeGroup = exports.delGroup = exports.authGroup = exports.userChangePwd = exports.userGroup = exports.modUser = exports.createUser = exports.changeUser = exports.delUser = exports.userInfo = exports.getUserList = exports.Login = exports.getAllMenu = exports.uploadUrl = undefined;

var _instrance = __webpack_require__(43);

var ax = _interopRequireWildcard(_instrance);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

//上传地址：
var uploadUrl = exports.uploadUrl = ax.uploadUrl;

//获取菜单
var getAllMenu = exports.getAllMenu = function getAllMenu(params) {
  return ax.g('/rule/uroles', params);
};

// 用户登录
var Login = exports.Login = function Login(params) {
  return ax.p('/user/login', params);
};

/**
 *  用户列表接口start
 */

//单个用户列表用户详细数据
var getUserList = exports.getUserList = function getUserList(params) {
  return ax.g('/user/search', params);
};

var userInfo = exports.userInfo = function userInfo(params) {
  return ax.g('/user/info', params);
};

//删除用户列表用户
var delUser = exports.delUser = function delUser(params) {
  return ax.d('/user/delete', params);
};

//更改用户状态
var changeUser = exports.changeUser = function changeUser(params) {
  return ax.u('/user/stat', params);
};

//新增用户
var createUser = exports.createUser = function createUser(params) {
  return ax.p('/user/add', params);
};

//修改用户资料
var modUser = exports.modUser = function modUser(params) {
  return ax.u('/user/update', params);
};

//添加用户--权限分组
var userGroup = exports.userGroup = function userGroup(params) {
  return ax.g('/user/groups', params);
};

//修改密码
var userChangePwd = exports.userChangePwd = function userChangePwd(params) {
  return ax.pa('/user/updatepwd', params);
};

/** 用户列表接口 end */

/** 权限接口 start */

//获取权限分组
var authGroup = exports.authGroup = function authGroup(params) {
  return ax.g('/rule/gsearch', params);
};

//删除用户列表用户
var delGroup = exports.delGroup = function delGroup(params) {
  return ax.d('/rule/gdelete', params);
};

//更改分组状态
var changeGroup = exports.changeGroup = function changeGroup(params) {
  return ax.u('/rule/stat', params);
};

//新增分组
var createGroup = exports.createGroup = function createGroup(params) {
  return ax.p('/rule/addgroup', params);
};

//修改分组
var updateGroup = exports.updateGroup = function updateGroup(params) {
  return ax.u('/rule/groupupdate', params);
};

//获取分组详情信息
var groupInfo = exports.groupInfo = function groupInfo(params) {
  return ax.g('/rule/groupinfo', params);
};
//获取权限列表
var getRule = exports.getRule = function getRule(params) {
  return ax.g('/rule/list', params);
};

/** 权限接口 end */

/** 商品管理中心 start */

/***** 品牌 start  ******/
//品牌列表
var getBrand = exports.getBrand = function getBrand(params) {
  return ax.g('/brand/lists', params);
};

//更改品牌状态
var brandStat = exports.brandStat = function brandStat(params) {
  return ax.pa('/brand/stat', params);
};

//删除品牌
var brandDel = exports.brandDel = function brandDel(params) {
  return ax.d('/brand/delete', params);
};

//添加品牌
var brandCreate = exports.brandCreate = function brandCreate(params) {
  return ax.p('/brand/create', params);
};

//修改品牌
var brandEdit = exports.brandEdit = function brandEdit(params) {
  return ax.u('/brand/update', params);
};

//获取品牌详情
var brandInfo = exports.brandInfo = function brandInfo(params) {
  return ax.g('/brand/info', params);
};

/****** 品牌end ******/

/** 商品分类start **/

//分类列表
var getCate = exports.getCate = function getCate(params) {
  return ax.g('/category/lists', params);
};

//添加分类
var cateCreate = exports.cateCreate = function cateCreate(params) {
  return ax.p('/category/create', params);
};

//修改分类
var cateEdit = exports.cateEdit = function cateEdit(params) {
  return ax.u('/category/update', params);
};

//获取分类祥情
var cateInfo = exports.cateInfo = function cateInfo(params) {
  return ax.g('/category/info', params);
};

//删除分类
var cateDel = exports.cateDel = function cateDel(params) {
  return ax.d('/category/delete', params);
};

/** 商品分类end **/

/** 属性模板 start */

//获取属性模板列表
var getAttrLists = exports.getAttrLists = function getAttrLists(params) {
  return ax.g('/attr/list', params);
};

//更改模板状态
var changeAttrStatus = exports.changeAttrStatus = function changeAttrStatus(params) {
  return ax.u('/user/stat', params);
};

//删除属性模板
var delAttr = exports.delAttr = function delAttr(params) {
  return ax.d('attr/delete', params);
};

//新增属性模板
var createAttrTemp = exports.createAttrTemp = function createAttrTemp(params) {
  return ax.p('/attr/create', params);
};

//修改属性模板
var updateAttrTemp = exports.updateAttrTemp = function updateAttrTemp(params) {
  return ax.u('/attr/update', params);
};

//获取模板详情
var getAttrTempInfo = exports.getAttrTempInfo = function getAttrTempInfo(params) {
  return ax.g('/attr/info', params);
};

/** 属性模板 end */

/** 仓库商品 start */

//商品列表
var getGoodsLists = exports.getGoodsLists = function getGoodsLists(params) {
  return ax.g('/goods/list', params);
};

//添加商品
var goodsCreate = exports.goodsCreate = function goodsCreate(params) {
  return ax.p('/goods/create', params);
};

//商品详情
var goodsInfo = exports.goodsInfo = function goodsInfo(params) {
  return ax.g('/goods/info', params);
};

//修改商品
var goodsEdit = exports.goodsEdit = function goodsEdit(params) {
  return ax.u('/goods/update', params);
};

/** 仓库商品 end */

/** 商品管理中心 end */

/** 门店管理start **/
var sellerLists = exports.sellerLists = function sellerLists(params) {
  return ax.g('/seller/list', params);
};

//添加门店
var sellerCreate = exports.sellerCreate = function sellerCreate(params) {
  return ax.p('/seller/create', params);
};

//获取门店信息
var sellerInfo = exports.sellerInfo = function sellerInfo(params) {
  return ax.g('/seller/info', params);
};

//修改门店
var sellerEdit = exports.sellerEdit = function sellerEdit(params) {
  return ax.u('/seller/update', params);
};

//更改门店状态
var sellerChange = exports.sellerChange = function sellerChange(params) {
  return ax.u('/seller/stat', params);
};

//删除门店
var sellerDel = exports.sellerDel = function sellerDel(params) {
  return ax.d('/seller/delete', params);
};

//地址信息
var area = exports.area = function area(params) {
  return ax.g('/seller/area', params);
};

//门店店员
var assistants = exports.assistants = function assistants(params) {
  return ax.g('/seller/asslist', params);
};

//门店商品
var sellerGoods = exports.sellerGoods = function sellerGoods(params) {
  return ax.g('/seller/goodslist', params);
};

//门店采购记录
var sellerPur = exports.sellerPur = function sellerPur(params) {
  return ax.g('/seller/orderlist', params);
};

//门店采购记录详情
var purchaseInfo = exports.purchaseInfo = function purchaseInfo(params) {
  return ax.g('/seller/orderinfo', params);
};

//门店结算记录
var sellerSettlement = exports.sellerSettlement = function sellerSettlement(params) {
  return ax.g('/seller/settlement', params);
};

//所有店员
var assistantsAll = exports.assistantsAll = function assistantsAll(params) {
  return ax.g('/seller/allasslist', params);
};

/** 门店管理end **/

/** 消费者管理 start **/

//消费者列表
var consumer = exports.consumer = function consumer(params) {
  return ax.g('/consumer/lists', params);
};

//消费者详情
var consumerInfo = exports.consumerInfo = function consumerInfo(params) {
  return ax.g('/consumer/info', params);
};

//消费者消费记录
var consumerOrder = exports.consumerOrder = function consumerOrder(params) {
  return ax.g('/consumer/orderlist', params);
};

//消费者订单详情
var consumerOrderInfo = exports.consumerOrderInfo = function consumerOrderInfo(params) {
  return ax.g('/consumer/orderinfo', params);
};

//消费者来电记录
var consumerCall = exports.consumerCall = function consumerCall(params) {
  return ax.g('/consumer/callorders', params);
};
//添加来电记录
var addCall = exports.addCall = function addCall(params) {
  return ax.p('consumer/addcall', params);
};

/** 消费者管理 end **/

/** 订单中心 start **/

//订单列表
var orderLists = exports.orderLists = function orderLists(params) {
  return ax.g('/order/list', params);
};
//呼叫记录列表
var orderCallList = exports.orderCallList = function orderCallList(params) {
  return ax.g('/consumer/callorders', params);
};

//订单详情
var orderInfo = exports.orderInfo = function orderInfo(params) {
  return ax.g('/order/info', params);
};
//代客下单
var addOrder = exports.addOrder = function addOrder(params) {
  return ax.p('/order/add', params);
};

/** 订单中心end **/

/** 财务中心 start */

var userOrders = exports.userOrders = function userOrders(params) {
  //消费者支付记录
  return ax.g('finance/userorders', params);
};

//消费者退款记录
var userRefund = exports.userRefund = function userRefund(params) {
  return ax.g('finance/userrefund', params);
};
//门店采购记录
var allSellerPur = exports.allSellerPur = function allSellerPur(params) {
  return ax.g('finance/purlist', params);
};
//门店结算记录
var allSellerPayments = exports.allSellerPayments = function allSellerPayments(params) {
  return ax.g('finance/settlement', params);
};
//结算审批列表 
var approvallist = exports.approvallist = function approvallist(params) {
  return ax.g('finance/approvallist', params);
};
//结算审批
var approval = exports.approval = function approval(params) {
  return ax.pa('finance/approval', params);
};
//退款列表
var refund = exports.refund = function refund(params) {
  return ax.g('finance/refundlist', params);
};
//退款审批
var refundSure = exports.refundSure = function refundSure(params) {
  return ax.pa('finance/refund', params);
};
//退款单信息
var refundInfo = exports.refundInfo = function refundInfo(params) {
  return ax.g('finance/refundinfo', params);
};

//仓库列表
var godown = exports.godown = function godown(params) {
  return ax.g('godown/list', params);
};
//添加仓库
var godownCreate = exports.godownCreate = function godownCreate(params) {
  return ax.p('godown/create', params);
};
//仓库详情
var godownInfo = exports.godownInfo = function godownInfo(params) {
  return ax.g('godown/info', params);
};

//修改仓库
var godownUpdate = exports.godownUpdate = function godownUpdate(params) {
  return ax.u('godown/update', params);
};
//更改仓库状态
var godownStatus = exports.godownStatus = function godownStatus(params) {
  return ax.pa('godown/status', params);
};
//删除仓库
var godownDel = exports.godownDel = function godownDel(params) {
  return ax.d('godown/delete', params);
};

//仓库人员
var godownUser = exports.godownUser = function godownUser(params) {
  return ax.g('godown/userlist', params);
};
//删除仓库人员
var godownUserDel = exports.godownUserDel = function godownUserDel(params) {
  return ax.d('godown/deleteuser', params);
};
//添加仓库人员
var godownUserCreate = exports.godownUserCreate = function godownUserCreate(params) {
  return ax.p('godown/adduser', params);
};

/***/ }),
/* 4 */,
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.userInfo = exports.delData = exports.getData = exports.setData = undefined;

var _jsCookie = __webpack_require__(53);

var _jsCookie2 = _interopRequireDefault(_jsCookie);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var setData = exports.setData = function setData(key, values) {
    _jsCookie2.default.set(key, values);
};

var getData = exports.getData = function getData(key) {
    return _jsCookie2.default.get(key);
};

var delData = exports.delData = function delData(key) {
    _jsCookie2.default.remove(key);
};

var userInfo = exports.userInfo = function userInfo() {
    var info = getData('userInfo');
    return JSON.parse(info);
};

/***/ }),
/* 6 */,
/* 7 */,
/* 8 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });

let config = {
    // env: Env,
    apiDomain:'http://staffs.api.mingyi.loc',
    // apiDomain: 'http://localhost:8088',
    imgUpload: 'http://localhost:8082/upload'
};
/* harmony default export */ __webpack_exports__["default"] = (config);

/***/ }),
/* 9 */,
/* 10 */,
/* 11 */,
/* 12 */,
/* 13 */,
/* 14 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var _import = __webpack_require__(45);

//login 
var Login = _import('Login/Login');

//layout
var layout = _import('main');

//主面板
var main = _import('index/index');

/** 用户模块 start **/
//用户中心
var userMain = _import('user/user');
//添加用户
var addUser = _import('user/add');
//修改用户
var editUser = _import('user/edit');

//修改密码
var changPwd = _import('user/pwd');
/** 用户模块 end */

/** 权限模块 start */

//权限列表
var authMain = _import('auth/rule');
//添加权限
var addAuth = _import('auth/add');
//修改权限
var editAuth = _import('auth/edit');
/** 权限模块end */

/**  商品模块 start  **/

//品牌列表
var brand = _import('brand/index');
//添加品牌
var brandAdd = _import('brand/add');
//编辑品牌
var brandEdit = _import('brand/edit');
//商品分类
var cate = _import('cate/index');

//商品模板
var goodsTempMain = _import('attr/index');
//添加商品模板
var addGoodsTemp = _import('attr/add');
//修改商品模板 
var editGoodsTemp = _import('attr/edit');

//商品列表
var goodsMain = _import('goods/index');
//添加商品
var addGoods = _import('goods/add');
//编辑商品
var editGoods = _import('goods/edit');
/** 商品模块 end  **/

/** 门店管理 start **/
var seller = _import('seller/index');
//添加门店
var sellerAdd = _import('seller/add');
//修改门店
var sellerEdit = _import('seller/edit');
//门店详情
var sellerInfo = _import('seller/info');
//店员管理
var sellerAsslist = _import('asslist/index');

/** 门店管理end **/

/** 消费者管理 start **/
//消费者列表
var consumer = _import('consumer/index');
//消费者详情
var consumerInfo = _import('consumer/info');
/** 消费者管理end **/

/** 订单模块 start **/

//订单列表
var order = _import('orders/index');
//订单详情
var orderInfo = _import('orders/info');

//呼叫中心
var call = _import('orders/call');
//代客下单
var buy = _import('orders/buy');

/** 订单模块 end **/

//** 财务中心 start */
var finance = _import('finance/index');
//结算审批列表
var cash = _import('finance/cash');
//退款审批列表
var refund = _import('finance/refund');
//退款单详情
var refundInfo = _import('finance/refundInfo');

//** 财务中心 end */

/** 仓库模块 start **/
//仓库列表
var godown = _import('godown/index');

//添加仓库
var godown_create = _import('godown/add');
//编辑仓库
var godown_update = _import('godown/edit');
//仓库人员
var godown_user = _import('godown/user');
//添加仓库人员
var godown_adduser = _import('godown/adduser');

/** 仓库模块 end **/

exports.default = [{
  path: '/login', component: Login, hidden: true
}, {
  path: '/', redirect: '/main', hidden: true
}, {
  path: '/main', name: '', icon: 'grid', component: layout, noDropdown: true, children: [{ path: '', name: '主页', component: main }]
}, {
  path: '/sys', name: '系统设置', icon: 'ios-cog', component: layout, redirect: '/sys/user',
  children: [{ path: 'user', name: '用户列表', meta: { alias: 'user' }, component: userMain }, { path: 'user/add', name: '添加用户', meta: { alias: 'user_add' }, component: addUser, hidden: true }, { path: 'user/edit', name: '编辑用户', meta: { alias: 'user_edit' }, component: editUser, hidden: true }, { path: 'user/change', name: '修改密码', meta: { alias: 'user_pwd' }, component: changPwd, hidden: true }, { path: 'group', name: '权限分组', meta: { alias: 'group' }, component: authMain }, { path: 'group/add', name: '添加分组', meta: { alias: 'group_add' }, component: addAuth, hidden: true }, { path: 'group/edit', name: '编辑分组信息', meta: { alias: 'group_edit' }, component: editAuth, hidden: true }]
}, {
  path: '/pro', name: '产品中心', component: layout, redirect: '/pro/goods', icon: 'android-playstore',
  children: [{ path: 'brand', name: '品牌列表', meta: { alias: 'brand' }, component: brand }, { path: 'brand/add', name: '添加品牌', meta: { alias: 'brand_create' }, component: brandAdd, hidden: true }, { path: 'brand/edit', name: '编辑品牌', meta: { alias: 'brand_update' }, component: brandEdit, hidden: true }, { path: 'cate', name: '商品分类', meta: { alias: 'cate' }, component: cate }, { path: 'cate/add', name: '添加分类', meta: { alias: 'cate_create' }, component: addGoodsTemp, hidden: true }, { path: 'cate/edit', name: '编辑分类', meta: { alias: 'cate_update' }, component: editGoodsTemp, hidden: true }, { path: 'attrtemp', name: '属性模板', meta: { alias: 'attr' }, component: goodsTempMain }, { path: 'attrtemp/add', name: '添加属性模板', meta: { alias: 'attr_create' }, component: addGoodsTemp, hidden: true }, { path: 'attrtemp/edit', name: '编辑属性模板', meta: { alias: 'attr_update' }, component: editGoodsTemp, hidden: true }, { path: 'goods', name: '商品列表', meta: { alias: 'goods' }, component: goodsMain }, { path: 'goods/add', name: '添加商品', meta: { alias: 'goods_add' }, component: addGoods, hidden: true }, { path: 'goods/edit', name: '编辑商品', meta: { alias: 'godos_edit' }, component: editGoods, hidden: true }]
}, {
  path: '/seller', name: '门店管理', component: layout, redirect: '/seller/store', icon: 'pricetags',
  children: [{ path: 'store', name: '门店列表', meta: { alias: 'seller' }, component: seller }, { path: 'store/add', name: '添加门店', meta: { alias: 'seller_create' }, component: sellerAdd, hidden: true }, { path: 'store/edit', name: '修改门店', meta: { alias: 'seller_update' }, component: sellerEdit, hidden: true }, { path: 'store/info', name: '门店详情', meta: { alias: 'seller_info' }, component: sellerInfo, hidden: true }, { path: 'asslist', name: '店员管理', meta: { alias: 'seller_all_asslist' }, component: sellerAsslist }]
}, {
  path: '/consumer', name: '消费者管理', component: layout, redirect: '/consumer/index', icon: 'cube',
  children: [{ path: 'index', name: '消费者列表', meta: { alias: 'consumer' }, component: consumer }, { path: 'info', name: '消费者详情', meta: { alias: 'consumer_info' }, component: consumerInfo, hidden: true }]
}, {
  path: '/order', name: '订单管理', component: layout, redirect: '/order/index', icon: 'bag',
  children: [{ path: 'index', name: '订单列表', meta: { alias: 'order' }, component: order }, { path: 'info', name: '订单详情', meta: { alias: 'order_info' }, component: orderInfo, hidden: true }, { path: 'call', name: '呼叫记录', meta: { alias: 'consumer_call' }, component: call }, { path: 'buy', name: '代客下单', meta: { alias: 'order_create' }, component: buy }]
}, {
  path: '/finance', name: '财务中心', component: layout, redirect: '/finance/index', icon: 'social-yen',
  children: [{ path: 'index', name: '支付记录', meta: { alias: 'finance_pay' }, component: finance }, { path: 'pay', name: '消费者支付记录', meta: { alias: 'finance_pay' }, component: finance, hidden: true }, { path: 'urefund', name: '消费者退款记录', meta: { alias: 'finance_refund' }, component: finance, hidden: true }, { path: 'purlist', name: '门店采购支付记录', meta: { alias: 'finance_purlist' }, component: finance, hidden: true }, { path: 'settlement', name: '门店结算记录', meta: { alias: 'finance_settle' }, component: finance, hidden: true }, { path: 'approvallist', name: '提现审批', meta: { alias: 'finance_cash' }, component: cash }, { path: 'approval', name: '提现申请', meta: { alias: 'finance_cash_audit' }, component: finance, hidden: true }, { path: 'refundlist', name: '退款审批', meta: { alias: 'finance_refund_applf' }, component: refund }, { path: 'refundinfo', name: '退款单详情', meta: { alias: 'finance_refund_audit' }, component: refundInfo, hidden: true }]
}, {
  path: '/godown', name: '仓库管理', component: layout, redirect: '/godown/index', icon: 'soup-can',
  children: [{ path: 'index', name: '仓库列表', meta: { alias: 'godown' }, component: godown }, { path: 'add', name: '添加仓库', meta: { alias: 'godown_create' }, component: godown_create, hidden: true }, { path: 'edit', name: '编辑仓库', meta: { alias: 'godown_update' }, component: godown_update, hidden: true }, { path: 'user', name: '仓库人员', meta: { alias: 'godown_userlist' }, component: godown_user }, { path: 'useradd', name: '添加仓库人员', meta: { alias: 'godown_adduser' }, component: godown_adduser, hidden: true }]
}];

/***/ }),
/* 15 */,
/* 16 */,
/* 17 */,
/* 18 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _vue = __webpack_require__(2);

var _vue2 = _interopRequireDefault(_vue);

var _vueRouter = __webpack_require__(62);

var _vueRouter2 = _interopRequireDefault(_vueRouter);

var _component = __webpack_require__(14);

var _component2 = _interopRequireDefault(_component);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_vue2.default.use(_vueRouter2.default);

exports.default = new _vueRouter2.default({
  routes: _component2.default
});

/***/ }),
/* 19 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _vue = __webpack_require__(2);

var _vue2 = _interopRequireDefault(_vue);

var _vuex = __webpack_require__(64);

var _vuex2 = _interopRequireDefault(_vuex);

var _actions = __webpack_require__(46);

var actions = _interopRequireWildcard(_actions);

var _getters = __webpack_require__(47);

var getters = _interopRequireWildcard(_getters);

var _menu = __webpack_require__(49);

var _menu2 = _interopRequireDefault(_menu);

var _user = __webpack_require__(51);

var _user2 = _interopRequireDefault(_user);

var _rule = __webpack_require__(50);

var _rule2 = _interopRequireDefault(_rule);

var _goods = __webpack_require__(48);

var _goods2 = _interopRequireDefault(_goods);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_vue2.default.use(_vuex2.default);

exports.default = new _vuex2.default.Store({
  actions: actions,
  getters: getters,
  modules: {
    menu: _menu2.default,
    user: _user2.default,
    rule: _rule2.default,
    goods: _goods2.default
  }
});

/***/ }),
/* 20 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _mockjs = __webpack_require__(54);

var _mockjs2 = _interopRequireDefault(_mockjs);

var _config = __webpack_require__(8);

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var URI = _config2.default.apiDomain;

//图片上传
_mockjs2.default.mock(_config2.default.imgUpload, {
    "success": true,
    "errors": [],
    "data": {
        "url": "http://localhost:8082/f4f791f9a2ff6341525a418e9f1f8ccb",
        "name": "测试的图片.jpg",
        "set_uri": "https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar",
        "hash": "f4f791f9a2ff6341525a418e9f1f8ccb",
        "frontend": []
    }
});

//权限信息
_mockjs2.default.mock(URI + '/rule/uroles', {
    "success": true,
    "errors": [],
    "data": {
        "ids": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75],
        "rules": ["user.list", "user.info", "user.add", "user.update", "user.stat", "user.delete", "user.search", "rule.list", "rule.uroles", "rule.group", "rule.addgroup", "rule.groupinfo", "rule.groupupdate", "rule.stat", "rule.gdelete", "rule.gsearch", "brand.lists", "brand.create", "brand.update", "brand.state", "brand.delete", "brand.info", "category.lists", "category.create", "category.update", "category.delete", "attr.create", "attr.update", "attr.list", "attr.info", "attr.delete", "goods.create", "goods.update", "goods.info", "goods.list", "goods.unitfactor", "goods.skuinfo", "goods.uupdate", "seller.create", "seller.update", "seller.info", "seller.stat", "seller.delete", "seller.asslist", "seller.orderlist", "seller.goodslist", "seller.list", "consumer.list", "consumer.orderlist", "consumer.orderinfo", "consumer.callorders", "order.list", "order.stat", "order.info", "order.add", "finance.userorders", "finance.userrefund", "finance.purlist", "finance.settlement", "finance.approvallist", "finance.approval", "finance.refundlist", "finance.refund", "seller.allasslist", "consumer.info", "godown.list", "godown.create", "godown.info", "godown.update", "godown.status", "godown.delete", "godown.adduser", "godown.userlist", "godown.deleteuser"]
    }
});
//登陆
_mockjs2.default.mock(URI + '/user/login', { "success": true, "errors": [], "data": { "userName": "adminTest", "id": 1, "img": null, "token": "35882fc40f9f2f224cc7486f41676110" } });

//单个用户列表用户详细数据
_mockjs2.default.mock(URI + '/user/search', {
    "success": true,
    "errors": [],
    "data": {
        "list": [{
            "id": 1,
            "name": "admin",
            "alias": "老板",
            "pwd": "08036c3a05dead0a9e62540ec801461a",
            "status": "1",
            "phone": "18080091166",
            "deleted_at": null,
            "created_at": "2017-07-06 10:41:30",
            "updated_at": "2017-08-14 18:29:23",
            "extend": "{\"loginToken\":\"35882fc40f9f2f224cc7486f41676110\"}"
        }, {
            "id": 4,
            "name": "root",
            "alias": "老板",
            "pwd": "4846bb538463e7a0a98accecdc0355dc",
            "status": "1",
            "phone": "18080091133",
            "deleted_at": null,
            "created_at": "2017-07-06 10:41:30",
            "updated_at": "2017-07-10 09:47:19",
            "extend": null
        }, {
            "id": 7,
            "name": "hahhah",
            "alias": null,
            "pwd": "2f71d04555cc7afda719f5299d85a303",
            "status": "0",
            "phone": "18080091166",
            "deleted_at": null,
            "created_at": "-0001-11-30 00:00:00",
            "updated_at": "2017-07-10 19:27:46",
            "extend": null
        }],
        "allCount": 3
    }
});

//用户详情
_mockjs2.default.mock(URI + '/user/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 1,
        "name": "admin",
        "alias": "老板",
        "phone": "18080091166",
        "status": "1",
        "datetime": "2017-07-06 10:41:30",
        "group": [{
            "id": 1,
            "name": "超级管理员"
        }]
    }
});
//删除用户列表用户
_mockjs2.default.mock(URI + '/user/delete', { "success": true, "errors": [], "data": [] });
//更改用户状态
_mockjs2.default.mock(URI + '/user/stat', { "success": true, "errors": [], "data": [] });
//新增用户
_mockjs2.default.mock(URI + '/user/add', { "success": true, "errors": [], "data": [] });
//修改用户资料
_mockjs2.default.mock(URI + '/user/update', { "success": true, "errors": [], "data": [] });
//添加用户--权限分组
_mockjs2.default.mock(URI + '/user/groups', {
    "success": true,
    "errors": [],
    "data": [{
        "id": 1,
        "name": "超级管理员"
    }, {
        "id": 2,
        "name": "普通用户"
    }, {
        "id": 3,
        "name": "测试"
    }, {
        "id": 4,
        "name": "财务人员"
    }]
});
//修改密码
_mockjs2.default.mock(URI + '/user/updatepwd', { "success": true, "errors": [], "data": [] });

//获取权限分组
_mockjs2.default.mock(URI + '/rule/gsearch', {
    "success": true,
    "errors": [],
    "data": {
        "groupList": [{
            "id": 1,
            "name": "超级管理员",
            "desc": "拥有所有的权限哟哟",
            "status": "1",
            "deleted_at": null,
            "created_at": "2017-07-06 11:32:32",
            "updated_at": "2017-07-11 16:18:06"
        }],
        "allCount": 1
    }
});
//删除分组
_mockjs2.default.mock(URI + '/rule/gdelete', { "success": true, "errors": [], "data": [] });
//更改分组状态
_mockjs2.default.mock(URI + '/rule/stat', { "success": true, "errors": [], "data": [] });
//新增分组
_mockjs2.default.mock(URI + '/rule/addgroup', { "success": true, "errors": [], "data": [] });
//修改分组
_mockjs2.default.mock(URI + '/rule/groupupdate', { "success": true, "errors": [], "data": [] });
//获取分组详情信息
_mockjs2.default.mock(URI + '/rule/groupinfo', {
    "success": true,
    "errors": [],
    "data": {
        "id": 1,
        "name": "超级管理员",
        "desc": "拥有所有的权限哟哟",
        "status": "1",
        "rule": {
            "1": "获取运营用户列表",
            "2": "查看运营人员详细信息",
            "3": "添加运营人员",
            "4": "运营用户信息修改",
            "5": "改变运营用户状态",
            "6": "删除运营用户",
            "7": "搜索运营用户",
            "8": "获取权限组模块",
            "9": "获取运营用户所拥有的权限",
            "10": "获取权限小组列表",
            "11": "添加权限小组",
            "12": "获取权限组详细信息",
            "13": "修改权限组",
            "14": "改变小组状态",
            "15": "删除权限小组",
            "16": "权限小组搜索",
            "17": "添加品牌",
            "18": "修改品牌",
            "19": "更改品牌状态",
            "20": "删除品牌",
            "22": "品牌详情",
            "23": "分类列表",
            "24": "添加商品分类",
            "25": "修改商品分类",
            "26": "删除商品分类",
            "27": "添加商品模板",
            "28": "修改商品模板",
            "29": "商品模板列表",
            "30": "商品模板列表详情",
            "31": "删除商品模板",
            "32": "添加商品",
            "33": "修改商品信息",
            "34": "商品详情",
            "36": "商品列表",
            "37": "商品单位转换",
            "38": "获取商品SKU信息",
            "39": "更新SKU信息",
            "40": "添加门店",
            "41": "修改门店",
            "42": "门店信息",
            "43": "更改门店状态",
            "44": "删除门店",
            "45": "获取门店店员",
            "46": "门店采购列表",
            "47": "门店在售商品",
            "48": "门店列表",
            "49": "消费者管理",
            "50": "消费者消费记录",
            "51": "消费者消费详情",
            "52": "消费者来电记录",
            "53": "订单列表",
            "54": "修改订单状态",
            "55": "订单详情",
            "56": "代客下单",
            "57": "消费者支付记录",
            "58": "消费者退款记录",
            "59": "门店采购记录",
            "60": "门店结算记录",
            "61": "门店提现申请",
            "62": "门店提现审核",
            "63": "用户退款申请",
            "64": "用户退款",
            "65": "查看所有店员",
            "66": "消费者详情",
            "67": "仓库列表",
            "68": "添加仓库",
            "69": "单个仓库信息",
            "70": "修改仓库",
            "71": "修改仓库状态",
            "72": "删除仓库",
            "73": "添加仓库人员",
            "74": "仓库人员列表",
            "75": "删除仓库人员"
        }
    }
});
//获取权限列表
_mockjs2.default.mock(URI + '/rule/list', {
    "success": true,
    "errors": [],
    "data": [{
        "id": 1,
        "name": "运营用户",
        "rule": {
            "1": "获取运营用户列表",
            "2": "查看运营人员详细信息",
            "3": "添加运营人员",
            "4": "运营用户信息修改",
            "5": "改变运营用户状态",
            "6": "删除运营用户",
            "7": "搜索运营用户"
        }
    }, {
        "id": 2,
        "name": "权限分组",
        "rule": {
            "8": "获取权限组模块",
            "9": "获取运营用户所拥有的权限",
            "10": "获取权限小组列表",
            "11": "添加权限小组",
            "12": "获取权限组详细信息",
            "13": "修改权限组",
            "14": "改变小组状态",
            "15": "删除权限小组",
            "16": "权限小组搜索"
        }
    }]
});

//品牌列表
_mockjs2.default.mock(URI + '/brand/lists', {
    "success": true,
    "errors": [],
    "data": {
        "count": 3,
        "datas": [{
            "id": 1,
            "name": "农夫山泉",
            "status": "1"
        }, {
            "id": 7,
            "name": "康师傅吧",
            "status": "1"
        }, {
            "id": 8,
            "name": "乐事",
            "status": "1"
        }]
    }
});
//更改品牌状态
_mockjs2.default.mock(URI + '/brand/stat', { "success": true, "errors": [], "data": [] });
//删除品牌
_mockjs2.default.mock(URI + '/brand/delete', { "success": true, "errors": [], "data": [] });
//添加品牌
_mockjs2.default.mock(URI + '/brand/create', { "success": true, "errors": [], "data": [] });
//修改品牌
_mockjs2.default.mock(URI + '/brand/update', { "success": true, "errors": [], "data": [] });
//获取品牌详情
_mockjs2.default.mock(URI + '/brand/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 1,
        "name": "测试添加品牌",
        "status": "1"
    }
});

//分类列表
_mockjs2.default.mock(URI + '/category/lists', {
    "success": true,
    "errors": [],
    "data": [{
        "id": 16,
        "name": "你好",
        "pid": 0,
        "status": "1"
    }, {
        "id": 20,
        "name": "零食",
        "pid": 0,
        "status": "1"
    }, {
        "id": 22,
        "name": "薯片",
        "pid": 20,
        "status": "1"
    }, {
        "id": 24,
        "name": "哎哟",
        "pid": 20,
        "status": "1"
    }, {
        "id": 25,
        "name": "不是吧",
        "pid": 20,
        "status": "1"
    }, {
        "id": 26,
        "name": "还有呢",
        "pid": 20,
        "status": "1"
    }, {
        "id": 27,
        "name": "还是有的",
        "pid": 24,
        "status": "1"
    }, {
        "id": 28,
        "name": "继续测试",
        "pid": 27,
        "status": "1"
    }, {
        "id": 29,
        "name": "好",
        "pid": 22,
        "status": "1"
    }]
});
//添加分类
_mockjs2.default.mock(URI + '/category/create', { "success": true, "errors": [], "data": { id: 3 } });
//修改分类
_mockjs2.default.mock(URI + '/category/update', { "success": true, "errors": [], "data": [] });
//获取分类祥情
_mockjs2.default.mock(URI + '/category/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 1,
        "name": "分类01",
        "pid": 0,
        "status": "1"
    }
});
//删除分类
_mockjs2.default.mock(URI + '/category/delete', { "success": true, "errors": [], "data": [] });

//获取属性模板列表
_mockjs2.default.mock(URI + '/attr/list', {
    "success": true,
    "errors": [],
    "data": {
        "count": 2,
        "datas": [{
            "id": 6,
            "name": "不是",
            "attr": "[{\"options\":[\"想想吧\"], \"attribute_id\":\"test\", \"attribute_name\":\"测试dev\"}]",
            "status": "1",
            "cateid": 16,
            "cateName": "你好"
        }, {
            "id": 8,
            "name": "薯片",
            "attr": "[{\"options\":[\"椒盐\", \"烧烤\", \"麻辣\"], \"attribute_id\":\"taste\", \"attribute_name\":\"口味\"}, {\"options\":[\"500g\", \"750g\"], \"attribute_id\":\"size\", \"attribute_name\":\"大小\"}]",
            "status": "1",
            "cateid": 22,
            "cateName": "薯片"
        }]
    }
});
//更改模板状态
// Mock.mock(URI + '/attr/list', { "success": true, "errors": [], "data": [] });
//删除属性模板
_mockjs2.default.mock(URI + '/attr/delete', { "success": true, "errors": [], "data": [] });
//新增属性模板
_mockjs2.default.mock(URI + '/attr/create', { "success": true, "errors": [], "data": [] });
//修改属性模板
_mockjs2.default.mock(URI + '/attr/update', { "success": true, "errors": [], "data": [] });
//获取模板详情
_mockjs2.default.mock(URI + '/attr/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 6,
        "name": "不是",
        "attribute_options": "[{\"options\":[\"想想吧\"], \"attribute_id\":\"test\", \"attribute_name\":\"测试dev\"}]",
        "status": "1",
        "catergoy_id": 16,
        "deleted_at": null,
        "created_at": "2017-07-13 12:57:25",
        "updated_at": "2017-07-13 19:32:14"
    }
});

//商品列表
_mockjs2.default.mock(URI + '/goods/list', {
    "success": true,
    "errors": [],
    "data": {
        "count": 3,
        "goodList": [{
            "goods_id": 18,
            "goods_name": "乐事薯片",
            "brand": "乐事",
            "category": "薯片",
            "life": 120,
            "status": "1",
            "place": "浙江",
            "company": "乐事薯片有限公司",
            "seller": "食品批发商",
            "defaultUnit": "包",
            "imgs": [{
                "hash": "5cf65d9fed1b7e255b1be1c25da0e1b9",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg"
            }]
        }, {
            "goods_id": 16,
            "goods_name": "乐事薯片",
            "brand": "农夫山泉",
            "category": "",
            "life": 180,
            "status": "1",
            "place": "浙江",
            "company": "乐事薯片有限公司",
            "seller": "食品公司",
            "defaultUnit": "包",
            "imgs": [{
                "hash": "5cf65d9fed1b7e255b1be1c25da0e1b9",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg"
            }]
        }, {
            "goods_id": 15,
            "goods_name": "农夫山泉矿泉水",
            "brand": "农夫山泉",
            "category": "你好",
            "life": 180,
            "status": "1",
            "place": "峨眉山",
            "company": "农夫山泉公司",
            "seller": "心空购物",
            "defaultUnit": "瓶",
            "imgs": [{
                "hash": "d58d1467874ae93d40857c3187668f49",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-d58d1467874ae93d40857c3187668f49.png"
            }]
        }]
    }
});
//添加商品
_mockjs2.default.mock(URI + '/goods/create', { "success": true, "errors": [], "data": 6 });
//商品详情
_mockjs2.default.mock(URI + '/goods/info', {
    "success": true,
    "errors": [],
    "data": {
        "goods_id": 15,
        "goods_name": "农夫山泉矿泉水",
        "alias": "农夫山泉，山泉，矿泉水",
        "cate_id": 16,
        "brand_id": 1,
        "warning": 0,
        "place": "峨眉山",
        "company": "农夫山泉公司",
        "seller": "心空购物",
        "life": 180,
        "attr": "[{\"id\":\"weidao\", \"name\":\"口味\", \"options\":[\"水蜜桃\", \"荔枝\"]}, {\"id\":\"size\", \"name\":\"容量\", \"options\":[\"500ml\", \"500ml\"]}]",
        "sku": [{
            "sku_id": 1,
            "goods_id": 15,
            "goods_name": "农夫山泉矿泉水 水蜜桃 + 500ml",
            "barcode": "1232453654",
            "price": "4.00",
            "wholease_price": "2.00",
            "image": [{
                "hash": "5cf65d9fed1b7e255b1be1c25da0e1b9",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg"
            }],
            "attribute": "{\"size\":\"500ml\", \"weidao\":\"水蜜桃\"}"
        }, {
            "sku_id": 2,
            "goods_id": 15,
            "goods_name": "农夫山泉矿泉水 荔枝 + 500ml",
            "barcode": "34654675545",
            "price": "5.00",
            "wholease_price": "2.00",
            "image": [{
                "hash": "d58d1467874ae93d40857c3187668f49",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-d58d1467874ae93d40857c3187668f49.png"
            }],
            "attribute": "{\"size\":\"500ml\", \"weidao\":\"荔枝\"}"
        }],
        "selectedAttr": {
            "0": "500ml",
            "1": "水蜜桃",
            "3": "荔枝"
        },
        "image": [{
            "set_uri": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-d58d1467874ae93d40857c3187668f49.png",
            "hash": "d58d1467874ae93d40857c3187668f49",
            "name": "Screenshot_20170713-161425.png"
        }],
        "desc": "hfhdsfsdfd",
        "status": "1",
        "units": [{
            "id": 28,
            "goods_id": 15,
            "name": "瓶",
            "factor": 1,
            "default": "1"
        }, {
            "id": 29,
            "goods_id": 15,
            "name": "件",
            "factor": 12,
            "default": "0"
        }, {
            "id": 44,
            "goods_id": 15,
            "name": "箱",
            "factor": 36,
            "default": "0"
        }]
    }
});
//修改商品
_mockjs2.default.mock(URI + '/goods/update', { "success": true, "errors": [], "data": [] });

//门店列表
_mockjs2.default.mock(URI + '/seller/list', {
    "success": true,
    "errors": [],
    "data": {
        "list": [{
            "id": 2,
            "name": "龙湖店",
            "city_id": 385,
            "area_id": 45056,
            "address": "成都市 高新区 龙湖世纪啥地方",
            "image": [{
                "hash": "5cf65d9fed1b7e255b1be1c25da0e1b9",
                "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg"
            }],
            "location": "26.074508 119.296494",
            "phone": "83252323",
            "status": "1",
            "master": "张三"
        }],
        "allCount": 1
    }
});
//添加门店
_mockjs2.default.mock(URI + '/seller/create', {
    "success": true,
    "errors": [],
    "data": {
        "seller_id": 3,
        "adminId": 4
    }
});
//获取门店信息
_mockjs2.default.mock(URI + '/seller/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 2,
        "name": "龙湖店",
        "city_id": 385,
        "area_id": 45056,
        "address": "成都市 高新区 龙湖世纪啥地方",
        "location": "26.074508 119.296494",
        "phone": "83252323",
        "image": {
            "hash": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "url": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg"
        },
        "admin": "张三",
        "adminPhone": "18080091133"
    }
});
//修改门店
_mockjs2.default.mock(URI + '/seller/update', { "success": true, "errors": [], "data": [] });
//更改门店状态
_mockjs2.default.mock(URI + '/seller/stat', { "success": true, "errors": [], "data": [] });
//删除门店
_mockjs2.default.mock(URI + '/seller/delete', { "success": true, "errors": [], "data": [] });
//地址信息
_mockjs2.default.mock(URI + '/seller/area', {
    "success": true,
    "errors": [],
    "data": {
        "list": [{
            "id": 385,
            "name": "成都市",
            "deep": 2
        }, {
            "id": 386,
            "name": "自贡市",
            "deep": 2
        }, {
            "id": 387,
            "name": "攀枝花市",
            "deep": 2
        }, {
            "id": 388,
            "name": "泸州市",
            "deep": 2
        }, {
            "id": 389,
            "name": "德阳市",
            "deep": 2
        }, {
            "id": 390,
            "name": "绵阳市",
            "deep": 2
        }, {
            "id": 391,
            "name": "广元市",
            "deep": 2
        }, {
            "id": 392,
            "name": "遂宁市",
            "deep": 2
        }, {
            "id": 393,
            "name": "内江市",
            "deep": 2
        }, {
            "id": 394,
            "name": "乐山市",
            "deep": 2
        }, {
            "id": 395,
            "name": "南充市",
            "deep": 2
        }, {
            "id": 396,
            "name": "眉山市",
            "deep": 2
        }, {
            "id": 397,
            "name": "宜宾市",
            "deep": 2
        }, {
            "id": 398,
            "name": "广安市",
            "deep": 2
        }, {
            "id": 399,
            "name": "达州市",
            "deep": 2
        }, {
            "id": 400,
            "name": "雅安市",
            "deep": 2
        }, {
            "id": 401,
            "name": "巴中市",
            "deep": 2
        }, {
            "id": 402,
            "name": "资阳市",
            "deep": 2
        }, {
            "id": 403,
            "name": "阿坝藏族羌族自治州",
            "deep": 2
        }, {
            "id": 404,
            "name": "甘孜藏族自治州",
            "deep": 2
        }, {
            "id": 405,
            "name": "凉山彝族自治州",
            "deep": 2
        }]
    }
});
//门店店员
_mockjs2.default.mock(URI + '/seller/asslist', {
    "success": true,
    "errors": [],
    "data": {
        "list": [{
            "id": 1,
            "name": "张三",
            "phone": "18080091133",
            "status": "1"
        }, {
            "id": 1,
            "name": "张三",
            "phone": "18080091133",
            "status": "0"
        }],
        "allCount": 2
    }
});
//门店商品
_mockjs2.default.mock(URI + '/seller/goodslist', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 3,
        "list": [{
            "sku_id": 1,
            "image": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "name": "农夫山泉矿泉水 水蜜桃 + 500ml",
            "price": "1.50",
            "save": 428,
            "sellNum": "5",
            "createTime": "2017-07-24 10:40:38",
            "attr": [{
                "name": "口味",
                "value": "水蜜桃"
            }, {
                "name": "容量",
                "value": "500ml"
            }],
            "unit": "瓶"
        }, {
            "sku_id": 2,
            "image": "d58d1467874ae93d40857c3187668f49",
            "name": "农夫山泉矿泉水 荔枝 + 500ml",
            "price": "15.00",
            "save": 300,
            "sellNum": "8",
            "createTime": "2017-07-24 10:41:14",
            "attr": [{
                "name": "口味",
                "value": "荔枝"
            }, {
                "name": "容量",
                "value": "500ml"
            }],
            "unit": "瓶"
        }, {
            "sku_id": 7,
            "image": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "name": "乐事薯片 椒盐 + 500g",
            "price": "13.00",
            "save": 250,
            "sellNum": "0",
            "createTime": "2017-07-24 10:41:37",
            "attr": [{
                "name": "口味",
                "value": "椒盐"
            }, {
                "name": "大小",
                "value": "500g"
            }],
            "unit": "包"
        }]
    }
});
//门店采购记录
_mockjs2.default.mock(URI + '/seller/orderlist', {
    "success": true,
    "errors": [],
    "data": {
        "list": [{
            "id": 6,
            "order_sn": "CD2017080652692",
            "seller_id": 2,
            "money": "536.00",
            "status": "待仓库确认",
            "payment_status": "待支付",
            "memo": "",
            "created_at": "2017-08-06 07:58:40"
        }, {
            "id": 4,
            "order_sn": "CD201708022BBA2",
            "seller_id": 2,
            "money": "536.00",
            "status": "已完成",
            "payment_status": "待支付",
            "memo": "",
            "created_at": "2017-08-02 00:05:06"
        }, {
            "id": 3,
            "order_sn": "CD201708029F6C2",
            "seller_id": 2,
            "money": "536.00",
            "status": "已完成",
            "payment_status": "待支付",
            "memo": "",
            "created_at": "2017-08-02 00:01:18"
        }, {
            "id": 1,
            "order_sn": "dfsdgfhgfjtyyt454",
            "seller_id": 2,
            "money": "23456.55",
            "status": "已完成",
            "payment_status": "待支付",
            "memo": "hah",
            "created_at": "2017-07-24 13:36:51"
        }],
        "allCount": 4
    }
});
//门店采购记录详情
_mockjs2.default.mock(URI + '/seller/orderinfo', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 2,
        "list": [{
            "sku_id": 1,
            "image": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "name": "农夫山泉矿泉水 水蜜桃 + 500ml",
            "attr": [{
                "name": "口味",
                "value": "水蜜桃"
            }, {
                "name": "容量",
                "value": "500ml"
            }],
            "pur_num": "28瓶",
            "minUnit_num": "28瓶",
            "price": "2.00",
            "createTime": "2017-08-06 07:58:40"
        }, {
            "sku_id": 8,
            "image": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "name": "乐事薯片 烧烤 + 500g",
            "attr": [{
                "name": "口味",
                "value": "烧烤"
            }, {
                "name": "大小",
                "value": "500g"
            }],
            "pur_num": "12箱",
            "minUnit_num": "240包",
            "price": "2.00",
            "createTime": "2017-08-06 07:58:40"
        }]
    }
});
//门店结算记录
_mockjs2.default.mock(URI + '/seller/settlement', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 1,
        "list": [{
            "time": "2017-07-24 16:13:59",
            "money": "12345.00"
        }]
    }
});
//所有店员
_mockjs2.default.mock(URI + '/seller/allasslist', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 3,
        "list": [{
            "id": 1,
            "name": "张三",
            "phone": "18080091133",
            "seller": "龙湖店",
            "status": "1"
        }, {
            "id": 2,
            "name": "李四",
            "phone": "18080091122",
            "seller": "会展店",
            "status": "1"
        }, {
            "id": 3,
            "name": "王五",
            "phone": "18080091111",
            "seller": "会展店",
            "status": "1"
        }]
    }
});

//消费者列表
_mockjs2.default.mock(URI + '/consumer/lists', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 3,
        "list": [{
            "id": 1,
            "name": "张三",
            "phone": "18080091133",
            "seller": "龙湖店",
            "status": "1"
        }, {
            "id": 2,
            "name": "李四",
            "phone": "18080091122",
            "seller": "会展店",
            "status": "1"
        }, {
            "id": 3,
            "name": "王五",
            "phone": "18080091111",
            "seller": "会展店",
            "status": "1"
        }]
    }
});
//消费者详情
_mockjs2.default.mock(URI + '/consumer/info', {
    "success": true,
    "errors": [],
    "data": {
        "id": 1,
        "name": "Tom",
        "phone": "18080091133",
        "city_id": 36,
        "area_id": 41,
        "address": "成都市 青羊区 金河路世纪大厦",
        "ext": "{\"wxToken\":\"qwertyuiop\"}"
    }
});
//消费者消费记录
_mockjs2.default.mock(URI + '/consumer/orderlist', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 3,
        "list": [{
            "id": 1,
            "order_num": "dfadgsdf34234",
            "seller": "龙湖店",
            "amount": "188.00",
            "price": "188.00",
            "fav": "无",
            "pay_type": "微信",
            "note": "无",
            "created_at": "2017-07-25 11:02:11",
            "pay_time": "2017-07-25 11:02:07",
            "order_status": "已完成"
        }, {
            "id": 2,
            "order_num": "345678989878",
            "seller": "龙湖店",
            "amount": "188.00",
            "price": "188.00",
            "fav": "无",
            "pay_type": "线下",
            "note": "无",
            "created_at": "2017-08-01 14:00:44",
            "pay_time": "2017-08-01 14:00:39",
            "order_status": "已取消"
        }, {
            "id": 3,
            "order_num": "G80181754177087912",
            "seller": "会展店",
            "amount": "18.00",
            "price": "18.00",
            "fav": "--",
            "pay_type": "线下",
            "note": "--",
            "created_at": "2017-08-01 18:02:34",
            "pay_time": "2017-08-01 10:02:34",
            "order_status": "待付款"
        }]
    }
});
//消费者订单详情
_mockjs2.default.mock(URI + '/consumer/orderinfo', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 2,
        "list": [{
            "sku_id": 1,
            "image": "5cf65d9fed1b7e255b1be1c25da0e1b9",
            "name": "农夫山泉矿泉水 水蜜桃 + 500ml",
            "price": "12.00",
            "amount": "60.00",
            "goodsNum": 5,
            "unit": "瓶",
            "fav": "无",
            "attr": [{
                "name": "口味",
                "value": "水蜜桃"
            }, {
                "name": "容量",
                "value": "500ml"
            }]
        }, {
            "sku_id": 2,
            "image": "d58d1467874ae93d40857c3187668f49",
            "name": "农夫山泉矿泉水 荔枝 + 500ml",
            "price": "15.00",
            "amount": "120.00",
            "goodsNum": 8,
            "unit": "瓶",
            "fav": "无",
            "attr": [{
                "name": "口味",
                "value": "荔枝"
            }, {
                "name": "容量",
                "value": "500ml"
            }]
        }]
    }
});
//消费者来电记录
_mockjs2.default.mock(URI + '/consumer/callorders', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 2,
        "list": [{
            "id": 2,
            "user_id": 5,
            "phone": "18080012233",
            "name": "18080012233",
            "call_type": "",
            "note": "价格问题",
            "created_at": "2017-08-01 17:50:34"
        }, {
            "id": 1,
            "user_id": 1,
            "phone": "18080091133",
            "name": "李先生",
            "call_type": "",
            "note": "一份大鸡腿",
            "created_at": "2017-07-25 13:51:55"
        }]
    }
});
//添加来电记录
_mockjs2.default.mock(URI + '/consumer/addcall', {
    "success": true,
    "errors": [],
    "data": []
});

//订单列表
_mockjs2.default.mock(URI + '/order/list', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 3,
        "list": [{
            "id": 3,
            "order_sn": "G80181754177087912",
            "seller": "会展店",
            "amount": "18.00",
            "fav": "--",
            "price": "18.00",
            "pay_type": "offline",
            "buyer": "Tom",
            "shipping_phone": "18080091133",
            "order_status": "wait",
            "created_at": "2017-08-01 18:02:34",
            "pay_type_name": "线下",
            "order_status_name": "待付款"
        }, {
            "id": 2,
            "order_sn": "345678989878",
            "seller": "龙湖店",
            "amount": "188.00",
            "fav": "无",
            "price": "188.00",
            "pay_type": "offline",
            "buyer": "Tom",
            "shipping_phone": "18080092233",
            "order_status": "cacel",
            "created_at": "2017-08-01 14:00:44",
            "pay_type_name": "线下",
            "order_status_name": "已取消"
        }, {
            "id": 1,
            "order_sn": "dfadgsdf34234",
            "seller": "龙湖店",
            "amount": "188.00",
            "fav": "无",
            "price": "188.00",
            "pay_type": "wechat",
            "buyer": "Tom",
            "shipping_phone": "18080092233",
            "order_status": "complate",
            "created_at": "2017-07-25 11:02:11",
            "pay_type_name": "微信",
            "order_status_name": "已完成"
        }]
    }
});
//订单详情
_mockjs2.default.mock(URI + '/order/info', {
    "success": true,
    "errors": [],
    "data": {
        "allCount": 1,
        "goodslist": [{
            "sku_id": 1,
            "image": "https://umijoy.s3.cn-north-1.amazonaws.com.cn/umijoy-5cf65d9fed1b7e255b1be1c25da0e1b9.jpg",
            "name": "农夫山泉矿泉水 水蜜桃 + 500ml",
            "price": "1.50",
            "amount": "18.00",
            "goodsNum": 12,
            "unit": "瓶",
            "fav": "--",
            "barcode": "1232453654",
            "attr": [{
                "name": "口味",
                "value": "水蜜桃"
            }, {
                "name": "容量",
                "value": "500ml"
            }]
        }],
        "order_sn": "G80181754177087912",
        "pay_type": "offline",
        "order_status": "wait",
        "amount": "18.00",
        "price": "18.00",
        "pay_time": "2017-08-01 10:02:34",
        "created_at": "2017-08-01 18:02:34",
        "buyer": "Tom",
        "seller": "会展店",
        "fav": "--",
        "shipping_address": "成都市 双流县 龙泉街道",
        "shipping_phone": "18080091133",
        "delivery_person": "--",
        "delivery_phone": "--",
        "delivery_type": "门店配送上门",
        "note": "--",
        "pay_type_name": "线下",
        "order_status_name": "待付款",
        "completeTime": " ",
        "order_id": "3"
    }
});
//代客下单
_mockjs2.default.mock(URI + '/order/add', {
    "success": true,
    "errors": [],
    "data": {
        "id": 23
    }
});

/***/ }),
/* 21 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 22 */
/***/ (function(module, exports, __webpack_require__) {

var Component = __webpack_require__(60)(
  /* script */
  __webpack_require__(42),
  /* template */
  __webpack_require__(61),
  /* styles */
  null,
  /* scopeId */
  null,
  /* moduleIdentifier (server only) */
  null
)

module.exports = Component.exports


/***/ }),
/* 23 */
/***/ (function(module, exports) {

module.exports = {
    // 用户
    user: 'user.list',  //管理员列表
    user_add: 'user.add', //新增管理员
    user_edit: 'user.update',//更新管理员
    user_info: 'user.info',//用户详情
    user_state: 'user.stat',//更改用户状态
    user_del: 'user.delete',//删除用户,

    //权限组
    group: 'rule.group',//权限分组
    group_add: 'rule.addgroup',//添加分组
    group_edit: 'rule.groupupdate',//编辑分组
    group_info: 'rule.groupinfo',//分组详情
    group_state: 'rule.stat',//更改用户状态
    group_del: 'rule.gdelete',//删除用户,

    //品牌
    brand_create: 'brand.create',//添加商品
    brand_update: 'brand.update',//修改品牌
    brand_stat: 'brand.state',//更改品牌状态
    brand_del: 'brand.delete',//删除品牌
    brand: 'brand.lists',//品牌列表
    brand_info: 'brand.info',//品牌详情

    //商品分类
    cate: 'category.lists',//商品分类列表
    cate_create: 'category.create',//添加商品分类
    cate_update: 'category.update',//修改商品分类
    cate_del: 'category.delete',//删除商品分类

    //商品模板
    attr_create: 'attr.create',//添加商品模板,
    attr_update: 'attr.update',//修改商品模板
    attr: 'attr.list',//商品属性模板
    attr_info: 'attr.info',//商品属性模板详情
    attr_del: 'attr.delete',//删除商品属性模板

    //商品
    goods: 'goods.list',//商品列表
    goods_add: 'goods.create',//添加商品
    godos_edit: 'goods.update',//修改商品
    goods_info: 'goods.info',//商品详情
    goods_factor: 'goods.unitfactor',//商品单位转换
    goods_sku: 'goods.skuinfo',//商品sku信息
    goods_sku_edit: 'goods.uupdate',//更新商品sku信息，


    //门店
    seller: 'seller.list',
    seller_create: 'seller.create',//添加门店
    seller_update: 'seller.update',//更改门店
    seller_info: 'seller.info',//门店信息
    seller_stat: 'seller.stat',//更改门店状态
    seller_del: 'seller.delete',//删除门店
    seller_asslist: 'seller.asslist',//获取门店店员
    seller_order: 'seller.orderlist',//门店订单
    seller_goods: 'seller.goodslist',//门店商品
    seller_all_asslist: 'seller.allasslist',//所有店员

    //消费者管理
    consumer: 'consumer.list',//消费者列表
    consumer_info: 'consumer.info',//消费者详情,
    consumer_order_list: 'consumer.orderlist',//消费者订单
    consumer_order_info: 'consumer.orderinfo',//订单详情
    consumer_call: 'consumer.callorders',//消费者来电记录

    //订单管理
    order: 'order.list',//订单列表
    order_state: 'order.stat',//订单状态
    order_info: 'order.info',//订单详情
    order_create: 'order.add',//代客下单

    //财务中心
    finance_pay: 'finance.userorders',//消费者支付记录
    finance_refund: 'finance.userrefund',//消费者退款记录,
    finance_purlist: 'finance.purlist',//门店采购记录
    finance_settle: 'finance.settlement',//门店结算记录 
    finance_cash: 'finance.approvallist',//门店提现申请
    finance_cash_audit: 'finance.approval',//门店提现审核
    finance_refund_applf: 'finance.refundlist',//用户退款申请
    finance_refund_audit: 'finance.refund',//用户退款审核

    //仓库相关
    godown: 'godown.list',//仓库列表
    godown_info: 'godown.info',//单个仓库信息
    godown_create: 'godown.create',//添加仓库
    godown_update: 'godown.update',//修改仓库
    godown_status: 'godown.status',//修改仓库状态
    godown_del: 'godown.delete',//删除仓库
    godown_adduser: 'godown.adduser',//添加仓库人员
    godown_userlist: 'godown.userlist',//仓库人员列表
    godown_deleteuser: 'godown.deleteuser',//删除仓库人员
}

/***/ }),
/* 24 */,
/* 25 */,
/* 26 */,
/* 27 */,
/* 28 */,
/* 29 */,
/* 30 */,
/* 31 */,
/* 32 */,
/* 33 */,
/* 34 */,
/* 35 */,
/* 36 */,
/* 37 */,
/* 38 */,
/* 39 */,
/* 40 */,
/* 41 */,
/* 42 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
//
//
//
//
//

exports.default = {
    name: 'app'
};

/***/ }),
/* 43 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.uploadUrl = exports.op = exports.pa = exports.u = exports.d = exports.p = exports.g = exports.itr = undefined;

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

exports.base = base;

var _axios = __webpack_require__(24);

var _axios2 = _interopRequireDefault(_axios);

var _config = __webpack_require__(8);

var _config2 = _interopRequireDefault(_config);

var _qs = __webpack_require__(55);

var _qs2 = _interopRequireDefault(_qs);

var _iview = __webpack_require__(7);

var _iview2 = _interopRequireDefault(_iview);

var _data = __webpack_require__(5);

var ac = _interopRequireWildcard(_data);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var URI = _config2.default.apiDomain;

var ax = _axios2.default.create({
    baseURL: URI,
    timeout: 30000,
    headers: {
        // 'Content-Type':'application/x-www-form-urlencoded',
        'TOKEN': ''
    }
});

var itr = exports.itr = function itr(type, url, params) {
    if ((typeof params === 'undefined' ? 'undefined' : _typeof(params)) !== 'object') {
        params = {};
    }
    var arg = _qs2.default.stringify(params);
    // url = type == 'get' || type == 'delete' ? url + '?' + arg : url;
    var userInfo = ac.getData('userInfo');
    var token = '';
    if (userInfo) {
        userInfo = typeof userInfo === 'string' ? JSON.parse(userInfo) : userInfo;
        token = userInfo.token ? userInfo.token : '';
    }
    ax.defaults.headers.TOKEN = token;
    return ax[type](url, arg);
};

var g = exports.g = function g(url, params) {
    return base('get', url, params);
};

var p = exports.p = function p(url, params) {
    return base('post', url, params);
};

var d = exports.d = function d(url, params) {
    return base('delete', url, params);
};

var u = exports.u = function u(url, params) {
    return base('put', url, params);
};
var pa = exports.pa = function pa(url, params) {
    return base('patch', url, params);
};

var op = exports.op = function op(url, params) {
    return base('options', url, params);
};

var uploadUrl = exports.uploadUrl = _config2.default.imgUpload;

function base(type, url, params) {
    return new Promise(function (resolve, reject) {
        itr(type, url, params).then(function (response) {
            if (response.data.success) {
                resolve(response.data.data);
            } else {
                _iview2.default.Notice.error({
                    title: '操作失败',
                    desc: '<p><span style="color:#ff3300">' + response.data.errors.code + '</span>   ' + response.data.errors.message + '</p>'
                });
                reject(response.data.errors.message);
            }
        }).catch(function (msg) {
            if (msg != 'code') {
                _iview2.default.Notice.error({
                    title: '网络访问错误',
                    desc: msg
                });
            }
            // reject(msg);
        });
    });
}

/***/ }),
/* 44 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _vue = __webpack_require__(2);

var _vue2 = _interopRequireDefault(_vue);

var _App = __webpack_require__(22);

var _App2 = _interopRequireDefault(_App);

var _router = __webpack_require__(18);

var _router2 = _interopRequireDefault(_router);

var _store = __webpack_require__(19);

var _store2 = _interopRequireDefault(_store);

var _iview = __webpack_require__(7);

var _iview2 = _interopRequireDefault(_iview);

var _mock = __webpack_require__(20);

var mock = _interopRequireWildcard(_mock);

__webpack_require__(21);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_vue2.default.config.productionTip = false; // The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.


_vue2.default.use(_iview2.default);

_router2.default.beforeEach(function (to, from, next) {
    var path = to.path.substr(1);
    var user = _store2.default.getters.baseInfo;
    if (path != 'login') {
        if (!user) {
            next('/login');
            return false;
        }
    } else {
        if (user) {
            next('/');
            return false;
        }
    }
    _iview2.default.LoadingBar.start();
    // to.matched.some(record => {console.log(record.meta)})
    next();
});

_router2.default.afterEach(function (to, from, next) {
    _iview2.default.LoadingBar.finish();
    window.scrollTo(0, 0);
    // 路径导航条
    var path = to.path.substr(1);
    var lan = {};
    var men = _store2.default.getters.getMenu;
    if (men) {
        var _iteratorNormalCompletion = true;
        var _didIteratorError = false;
        var _iteratorError = undefined;

        try {
            for (var _iterator = men[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
                var m = _step.value;

                if (m.children.length) {
                    var _iteratorNormalCompletion2 = true;
                    var _didIteratorError2 = false;
                    var _iteratorError2 = undefined;

                    try {
                        for (var _iterator2 = m.children[Symbol.iterator](), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
                            var item = _step2.value;

                            if (m.path + '/' + item.path == '/' + path) {
                                lan = {
                                    first: m.name,
                                    last: item.name
                                };
                                break;
                            }
                        }
                    } catch (err) {
                        _didIteratorError2 = true;
                        _iteratorError2 = err;
                    } finally {
                        try {
                            if (!_iteratorNormalCompletion2 && _iterator2.return) {
                                _iterator2.return();
                            }
                        } finally {
                            if (_didIteratorError2) {
                                throw _iteratorError2;
                            }
                        }
                    }
                }
            }
        } catch (err) {
            _didIteratorError = true;
            _iteratorError = err;
        } finally {
            try {
                if (!_iteratorNormalCompletion && _iterator.return) {
                    _iterator.return();
                }
            } finally {
                if (_didIteratorError) {
                    throw _iteratorError;
                }
            }
        }

        if (JSON.stringify(lan) != '{}') {
            _store2.default.dispatch('actbreadcrumbions', lan);
        }
    }
});

/* eslint-disable no-new */
new _vue2.default({
    store: _store2.default,
    el: '#app',
    router: _router2.default,
    template: '<App/>',
    components: { App: _App2.default }
});

/***/ }),
/* 45 */
/***/ (function(module, exports) {

throw new Error("Module build failed: SyntaxError: Unexpected token (1:31)\n\n\u001b[0m\u001b[31m\u001b[1m>\u001b[22m\u001b[39m\u001b[90m 1 | \u001b[39mmodule\u001b[33m.\u001b[39mexports \u001b[33m=\u001b[39m file \u001b[33m=>\u001b[39m () \u001b[33m=>\u001b[39m \u001b[36mimport\u001b[39m(\u001b[32m'@/components/'\u001b[39m \u001b[33m+\u001b[39m file \u001b[33m+\u001b[39m \u001b[32m'.vue'\u001b[39m)\n \u001b[90m   | \u001b[39m                               \u001b[31m\u001b[1m^\u001b[22m\u001b[39m\n \u001b[90m 2 | \u001b[39m\u001b[0m\n");

/***/ }),
/* 46 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
        value: true
});
exports.actbreadcrumbions = undefined;

var _mutationTypes = __webpack_require__(1);

var types = _interopRequireWildcard(_mutationTypes);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

//路径面包屑
var actbreadcrumbions = exports.actbreadcrumbions = function actbreadcrumbions(_ref, crumb) {
        var commit = _ref.commit;

        commit(types.BREADCRUMB, crumb);
};

/***/ }),
/* 47 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var crumb = exports.crumb = function crumb(state) {
  return state.menu.crumb;
};

/***/ }),
/* 48 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _mutations;

var _mutationTypes = __webpack_require__(1);

var types = _interopRequireWildcard(_mutationTypes);

var _common = __webpack_require__(3);

var api = _interopRequireWildcard(_common);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

var state = {
    attrLists: [],
    classify: [{ keys: '', alias: '', vs: new Set() }],
    goodsLists: []
};

var getters = {
    //属性模板列表
    getAttrLists: function getAttrLists(state) {
        return state.attrLists;
    },
    //属性模板具体属性值
    getClassify: function getClassify(state) {
        return state.classify;
    },
    //仓库商品列表
    getGoodsLists: function getGoodsLists(state) {
        return state.goodsLists;
    }
};

var actions = {
    //属性模板列表
    attrLists: function attrLists(_ref, searchParams) {
        var commit = _ref.commit;

        api.getAttrLists(searchParams).then(function (lists) {
            commit(types.ATTRLIST, lists);
        });
    },
    //属性模板具体属性值
    classify: function classify(_ref2, data) {
        var commit = _ref2.commit;

        commit(types.CLASSIFY, data);
    },

    //仓库商品列表
    goodsLists: function goodsLists(_ref3, searchParams) {
        var commit = _ref3.commit;

        api.getGoodsLists(searchParams).then(function (lists) {
            commit(types.GOODSLIST, lists);
        });
    }
};

var mutations = (_mutations = {}, _defineProperty(_mutations, types.ATTRLIST, function (state, lists) {
    state.attrLists = lists;
}), _defineProperty(_mutations, types.CLASSIFY, function (state, data) {
    if (!data || data.length < 1) {
        data = [{ keys: '', alias: '', vs: [] }];
    }
    data.map(function (item) {
        item.vs = new Set(item.vs);
        return item;
    });
    state.classify = data;
}), _defineProperty(_mutations, types.GOODSLIST, function (state, data) {
    state.goodsLists = data;
}), _mutations);

exports.default = {
    state: state,
    getters: getters,
    actions: actions,
    mutations: mutations
};

/***/ }),
/* 49 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _mutations;

var _mutationTypes = __webpack_require__(1);

var types = _interopRequireWildcard(_mutationTypes);

var _common = __webpack_require__(3);

var api = _interopRequireWildcard(_common);

var _data = __webpack_require__(5);

var ac = _interopRequireWildcard(_data);

var _component = __webpack_require__(14);

var _component2 = _interopRequireDefault(_component);

var _menu = __webpack_require__(23);

var _menu2 = _interopRequireDefault(_menu);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

//state
var state = {
    menu: null,
    crumb: {
        first: '',
        last: ''
    }
};

//创建getters
var getters = {
    getMenu: function getMenu(state) {
        var m = state.menu;
        if (!state.menu) {
            m = ac.getData('menu');
        }
        if (typeof m === 'string') {
            return JSON.parse(m);
        }
        return m;
    }

    //创建actions
};var actions = {
    //获取权限菜单
    getAllAuthMenu: function getAllAuthMenu(_ref) {
        var commit = _ref.commit;
        var resh = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;

        var menu = ac.getData('menu');
        if (resh || !menu) {
            var user = JSON.parse(ac.getData('userInfo'));

            api.getAllMenu({ uid: user.id }).then(function (re) {
                var c = JSON.parse(JSON.stringify(_component2.default));
                var m = handleMenu(c, re.rules);
                ac.setData('auth', re.rules);
                ac.setData('menu', m);
                commit(types.GET_MENU, m);
            });
        } else {
            commit(types.GET_MENU, menu);
        }
    }

    //提交状态改变
};var mutations = (_mutations = {}, _defineProperty(_mutations, types.GET_MENU, function (state, menus) {
    state.menu = menus;
}), _defineProperty(_mutations, types.BREADCRUMB, function (state, crumb) {
    state.crumb = crumb;
}), _mutations);

//过滤菜单
function handleMenu(r, rules) {
    for (var i = 0; i < r.length; i++) {
        delete r[i].component;
        //过滤子栏目下权限不足的菜单
        if (r[i].hasOwnProperty('children')) {
            var access = handleMenu(r[i]['children'], rules);
            if (access.length > 0) {
                r[i]['children'] = access;
                if (access.length == 1) {
                    r[i]['noDropdown'] = true;
                }
            } else {
                r.splice(i, 1, false);
            }
        }
        if (r[i].hasOwnProperty('hidden') && r[i].hidden) {
            r.splice(i, 1, false);
        }
        if (r[i].hasOwnProperty('meta') && r[i]['meta'].hasOwnProperty('alias') && rules.indexOf(_menu2.default[r[i]['meta']['alias']]) == -1) {
            r.splice(i, 1, false);
        }
    }
    var a = r.filter(function (item) {
        return item ? 1 : 0;
    });
    return a;
}

exports.default = {
    state: state,
    getters: getters,
    actions: actions,
    mutations: mutations
};

/***/ }),
/* 50 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _mutationTypes = __webpack_require__(1);

var types = _interopRequireWildcard(_mutationTypes);

var _common = __webpack_require__(3);

var api = _interopRequireWildcard(_common);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

//state
var state = {
    groupList: ''
};

//创建getters
var getters = {
    getGroup: function getGroup(state) {
        return state.groupList;
    }

    //创建actions
};var actions = {
    //获取用户列表
    getGroupList: function getGroupList(_ref, searchParams) {
        var commit = _ref.commit;

        api.authGroup(searchParams).then(function (list) {
            commit(types.GROUPLIST, list);
        });
    }

    //提交状态改变
};var mutations = _defineProperty({}, types.GROUPLIST, function (satate, lists) {
    state.groupList = lists;
});

exports.default = {
    state: state,
    getters: getters,
    actions: actions,
    mutations: mutations
};

/***/ }),
/* 51 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _mutations;

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var _mutationTypes = __webpack_require__(1);

var types = _interopRequireWildcard(_mutationTypes);

var _common = __webpack_require__(3);

var api = _interopRequireWildcard(_common);

var _data = __webpack_require__(5);

var ac = _interopRequireWildcard(_data);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

//state
var state = {
    info: null,
    userList: ''
};

//创建getters
var getters = {
    //当前登陆用户信息
    getUserInfo: function getUserInfo(state) {
        var info = getters.baseInfo();
        var defaultInfo = {
            img: '',
            userName: ''
        };
        return Object.assign(defaultInfo, info);
    },
    //当前登陆用户基础信息
    baseInfo: function baseInfo(satate) {
        var info = state.info;
        if (!info) {
            info = ac.getData('userInfo') || null;
        }
        if ((typeof info === 'undefined' ? 'undefined' : _typeof(info)) !== 'object') {
            info = JSON.parse(info);
        }
        return info;
    },

    //获取用户列表
    getUserList: function getUserList(state) {
        return state.userList;
    }

    //创建actions
};var actions = {
    //登陆状态
    Login: function Login(_ref, userInfo) {
        var commit = _ref.commit;

        ac.setData('userInfo', userInfo);
        commit(types.USERINFO, userInfo);
    },
    //退出登录
    loginOut: function loginOut(_ref2) {
        var commit = _ref2.commit;

        ac.delData('userInfo');
        ac.delData('auth');
        ac.delData('menu');
        commit(types.USERINFO, null);
    },

    //获取用户列表
    getUserList: function getUserList(_ref3, searchParams) {
        var commit = _ref3.commit;

        api.getUserList(searchParams).then(function (list) {
            commit(types.USERLIST, list);
        });
    }

    //提交状态改变
};var mutations = (_mutations = {}, _defineProperty(_mutations, types.USERINFO, function (state, info) {
    state.info = info;
}), _defineProperty(_mutations, types.USERLIST, function (satate, lists) {
    state.userList = lists;
}), _mutations);

exports.default = {
    state: state,
    getters: getters,
    actions: actions,
    mutations: mutations
};

/***/ }),
/* 52 */,
/* 53 */,
/* 54 */,
/* 55 */,
/* 56 */,
/* 57 */,
/* 58 */,
/* 59 */,
/* 60 */,
/* 61 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', [_c('router-view')], 1)
},staticRenderFns: []}

/***/ })
],[44]);
//# sourceMappingURL=app.6cc4d97c70bb4dedb609.js.map