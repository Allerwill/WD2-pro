<?php

Route::get('/', [
    'as' => 'home',
    'uses' => 'PageController@getIndex'
]);

Route::get('index.html', [
    'as' => 'home',
    'uses' => 'PageController@getIndex'
]);

Route::get('product.html', [
    'as' => 'product',
    'uses' => 'PageController@getProduct'
]);

Route::get('allproduct.html', [
    'as' => 'allproduct',
    'uses' => 'PageController@getAllProduct'
]);

Route::get('product-type/type-{id-type}.html', [
    'as' => 'product-type',
    'uses' => 'PageController@getProductType'
]);

Route::post('search.html', [
    'as' => 'search',
    'uses' => 'PageController@postSearch'
]);

Route::post('sort.html', [
    'as' => 'sort',
    'uses' => 'PageController@postSort'
]);

Route::get('product-detail/product-{id}.html', [
    'as' => 'product-detail',
    'uses' => 'PageController@getProductDetail'
]);

Route::get('contact.html', [
    'as' => 'contact',
    'uses' => 'PageController@getContact'
]);

Route::get('about.html', [
    'as' => 'about',
    'uses' => 'PageController@getAbout'
]);

Route::get('payment.html', [
    'as' => 'payment',
    'uses' => 'PageController@getPayment'
]);

Route::post('payment.html', [
    'as' => 'payment',
    'uses' => 'PageController@postPayment'
]);

Route::get('login.html', [
    'as' => 'login',
    'uses' => 'PageController@getLogin'
]);

Route::get('logout.html', [
    'as' => 'logout',
    'uses' => 'PageController@getLogout'
]);

Route::post('login.html', [
    'as' => 'login',
    'uses' => 'PageController@postLogin'
]);

Route::get('register.html', [
    'as' => 'register',
    'uses' => 'PageController@getRegister'
]);

Route::post('register.html', [
    'as' => 'register',
    'uses' => 'PageController@postRegister'
]);

Route::get('repass.html', [
    'as' => 'repass',
    'uses' => 'PageController@getRepass'
]);

Route::get('addtocart/add-one-{id}.html', [
    'as' => 'addtocart',
    'uses' => 'PageController@getAddToCart'
]);

Route::get('deletecart/delete-{id}.html', [
    'as' => 'deletecart',
    'uses' => 'PageController@getDeleteCart'
]);

Route::get('reducecart/reduce-one-{id}.html', [
    'as' => 'reducecart',
    'uses' => 'PageController@getReduceCart'
]);

Route::get('profile.html', [
    'as' => 'profile',
    'uses' => 'PageController@getProfile'
]);

Route::post('profile.html', [
    'as' => 'profile',
    'uses' => 'PageController@postProfile'
]);

Route::get('repass.html', [
    'as' => 'repass',
    'uses' => 'PageController@getRepass'
]);

Route::post('repass.html', [
    'as' => 'repass',
    'uses' => 'PageController@postRepass'
]);


//
//*ADMIN SYSTEM DATABASE
//
Route::get('admin', [
    'as' => 'dashboard',
    'uses' => 'AdminController@getDashboard'
]);

Route::get('go', [
    'as' => 'dashboard',
    'uses' => 'AdminController@getDashboard'
]);

Route::get('admin/index.html', [
    'as' => 'dashboard',
    'uses' => 'AdminController@getDashboard'
]);

Route::get('admin/dashboard/index.html', [
    'as' => 'dashboard',
    'uses' => 'AdminController@getDashboard'
]);


//Get All
Route::get('admin/types.html', [
    'as' => 'types',
    'uses' => 'AdminController@getType'
]);
Route::post('admin/types.html', [
    'as' => 'types',
    'uses' => 'AdminController@postType'
]);
Route::get('admin/products.html', [
    'as' => 'products',
    'uses' => 'AdminController@getProducts'
]);
Route::post('admin/products.html', [
    'as' => 'products',
    'uses' => 'AdminController@postProducts'
]);
Route::get('admin/slides.html', [
    'as' => 'slides',
    'uses' => 'AdminController@getSlides'
]);
Route::post('admin/slides.html', [
    'as' => 'slides',
    'uses' => 'AdminController@postSlides'
]);
Route::get('admin/users.html', [
    'as' => 'users',
    'uses' => 'AdminController@getUsers'
]);
Route::post('admin/users.html', [
    'as' => 'users',
    'uses' => 'AdminController@postUsers'
]);
Route::get('admin/customers.html', [
    'as' => 'customers',
    'uses' => 'AdminController@getCustomers'
]);
Route::post('admin/customers.html', [
    'as' => 'customers',
    'uses' => 'AdminController@postCustomers'
]);
Route::get('admin/bills.html', [
    'as' => 'bills',
    'uses' => 'AdminController@getBills'
]);
Route::post('admin/bills.html', [
    'as' => 'bills',
    'uses' => 'AdminController@postBills'
]);


//Get add
Route::get('admin/addtype.html', [
    'as' => 'addtype',
    'uses' => 'AdminController@getAddtype'
]);
Route::get('admin/addproduct.html', [
    'as' => 'addproduct',
    'uses' => 'AdminController@getAddproduct'
]);
Route::get('admin/addslide.html', [
    'as' => 'addslide',
    'uses' => 'AdminController@getAddslide'
]);
Route::get('admin/adduser.html', [
    'as' => 'adduser',
    'uses' => 'AdminController@getAdduser'
]);
Route::get('admin/addcustomer.html', [
    'as' => 'addcustomer',
    'uses' => 'AdminController@getAddcustomer'
]);



//get Edit
Route::get('admin/edittype/{id}.html', [
    'as' => 'edittype_',
    'uses' => 'AdminController@getEdittype'
]);
Route::get('admin/editproduct/{id}.html', [
    'as' => 'editproduct_',
    'uses' => 'AdminController@getEditproduct'
]);
Route::get('admin/editslide/{id}.html', [
    'as' => 'editslide_',
    'uses' => 'AdminController@getEditslide'
]);
Route::get('admin/editcustomer/{id}.html', [
    'as' => 'editcustomer_',
    'uses' => 'AdminController@getEditcustomer'
]);




//Post add
Route::post('admin/addtype.html', [
    'as' => 'addtype',
    'uses' => 'AdminController@postAddtype'
]);
Route::post('admin/addproduct.html', [
    'as' => 'addproduct',
    'uses' => 'AdminController@postAddproduct'
]);
Route::post('admin/addslide.html', [
    'as' => 'addslide',
    'uses' => 'AdminController@postAddslide'
]);
Route::post('admin/adduser.html', [
    'as' => 'adduser',
    'uses' => 'AdminController@postAdduser'
]);
Route::post('admin/addcustomer.html', [
    'as' => 'addcustomer',
    'uses' => 'AdminController@postAddcustomer'
]);



//Post edit
Route::post('admin/edittype.html', [
    'as' => 'edittype',
    'uses' => 'AdminController@postEdittype'
]);
Route::post('admin/editproduct.html', [
    'as' => 'editproduct',
    'uses' => 'AdminController@postEditproduct'
]);
Route::post('admin/editslide.html', [
    'as' => 'editslide',
    'uses' => 'AdminController@postEditslide'
]);
Route::post('admin/editcustomer.html', [
    'as' => 'editcustomer',
    'uses' => 'AdminController@postEditcustomer'
]);



//Delete
Route::get('admin/deltype/{id}.html', [
    'as' => 'deltype',
    'uses' => 'AdminController@getDeltype'
]);
Route::get('admin/delproduct/{id}.html', [
    'as' => 'delproduct',
    'uses' => 'AdminController@getDelproduct'
]);
Route::get('admin/delslide/{id}.html', [
    'as' => 'delslide',
    'uses' => 'AdminController@getDelslide'
]);
Route::get('admin/deluser/{id}.html', [
    'as' => 'deluser',
    'uses' => 'AdminController@getDeluser'
]);
Route::get('admin/delcustomer/{id}.html', [
    'as' => 'delcustomer',
    'uses' => 'AdminController@getDelcustomer'
]);
Route::get('admin/delbill/{id}.html', [
    'as' => 'delbill',
    'uses' => 'AdminController@getDelbill'
]);



//Set Arrange
Route::get('admin/sttType/{id}.html', [
    'as' => 'sttType',
    'uses' => 'AdminController@setSttType'
]);
Route::get('admin/sttProduct/{id}.html', [
    'as' => 'sttProduct',
    'uses' => 'AdminController@setSttProduct'
]);
Route::get('admin/sttNews/{id}.html', [
    'as' => 'sttNews',
    'uses' => 'AdminController@setSttNews'
]);
Route::get('admin/sttSlide/{id}.html', [
    'as' => 'sttSlide',
    'uses' => 'AdminController@setSttSlide'
]);
Route::get('admin/sttUser/{id}.html', [
    'as' => 'sttUser',
    'uses' => 'AdminController@setSttUser'
]);
Route::get('admin/sttCustomer/{id}.html', [
    'as' => 'sttCustomer',
    'uses' => 'AdminController@setSttCustomer'
]);
Route::get('admin/sttBill/{id}.html', [
    'as' => 'sttBill',
    'uses' => 'AdminController@setSttBill'
]);



//get view
Route::get('admin/viewtype/{id}.html', [
    'as' => 'viewtype',
    'uses' => 'AdminController@getViewtype'
]);
Route::get('admin/viewproduct/{id}.html', [
    'as' => 'viewproduct',
    'uses' => 'AdminController@getViewproduct'
]);
Route::get('admin/viewuser/{id}.html', [
    'as' => 'viewuser',
    'uses' => 'AdminController@getViewuser'
]);
Route::get('admin/viewcustomer/{id}.html', [
    'as' => 'viewcustomer',
    'uses' => 'AdminController@getViewcustomer'
]);
Route::get('admin/viewbill/{id}.html', [
    'as' => 'viewbill',
    'uses' => 'AdminController@getViewbill'
]);

//Setting system
Route::get('admin/system.html', [
    'as' => 'system',
    'uses' => 'AdminController@getSystem'
]);
Route::get('admin/sysstt{id}.html', [
    'as' => 'sysstt',
    'uses' => 'AdminController@setSysStt'
]);
Route::post('admin/syslogo.html', [
    'as' => 'syslogo',
    'uses' => 'AdminController@setSyslogo'
]);
Route::post('admin/systitle.html', [
    'as' => 'systitle',
    'uses' => 'AdminController@setSystitle'
]);
Route::post('admin/sysabout.html', [
    'as' => 'sysabout',
    'uses' => 'AdminController@setSysabout'
]);
Route::post('admin/syscontact.html', [
    'as' => 'syscontact',
    'uses' => 'AdminController@setSyscontact'
]);
Route::post('admin/sysheader.html', [
    'as' => 'sysheader',
    'uses' => 'AdminController@setSysheader'
]);
Route::post('admin/sysfooter.html', [
    'as' => 'sysfooter',
    'uses' => 'AdminController@setSysfooter'
]);
Route::post('admin/syspayment.html', [
    'as' => 'syspayment',
    'uses' => 'AdminController@setSyspayment'
]);
Route::post('admin/syssocial.html', [
    'as' => 'syssocial',
    'uses' => 'AdminController@setSyssocial'
]);

Route::get('admin/login-admin.html', [
    'as' => 'loginadmin',
    'uses' => 'AdminController@getLogin'
]);

Route::post('admin/login-admin.html', [
    'as' => 'loginadmin',
    'uses' => 'AdminController@postLogin'
]);

Route::get('admin/logout-admin.html', [
    'as' => 'logoutadmin',
    'uses' => 'AdminController@getLogout'
]);

Route::get('profile_admin.html', [
    'as' => 'profile_admin',
    'uses' => 'AdminController@getProfile'
]);

Route::post('profile_admin.html', [
    'as' => 'profile_admin',
    'uses' => 'AdminController@postProfile'
]);