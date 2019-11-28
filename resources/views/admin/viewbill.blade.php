@extends('admin_master')
@section('admin_content')
<div id="page-wrapper" style="min-height: 295px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="{{route('bills')}}"><i class="fa fa-caret-square-o-up" style="color: #ffffff;"></i></a> Invoice infor
                </div>
                <div class="panel-body">
                    <p>
                        <span>Invoice ID: </span><strong> {{@$b->id}} </strong>
                    </p>
                    <p>
                        <span>Customer ID: </span><strong> <a href="{{route('viewcustomer',@$b->id_customer)}}">Xem KH {{@$b->id_customer}}</a> </strong>
                    </p>
                    <p>
                        <span>Order date: </span><strong> {{@$b->date_order}} </strong>
                    </p>
                    <p>
                        <span>Total: </span><strong> {{number_format(@$b->total)}}đ </strong>
                    </p>
                    <p>
                        <span>Payment method: </span><strong> {{@$b->payment}} </strong>
                    </p>
                    <p>
                        <span>Note: </span><p> {{@$b->note}} </p>
                    </p>
                    <p>
                        <span>Coupon: </span><strong> {{@$b->code}} </strong>
                    </p>
                    <p>
                        <span>Status: </span>
                        <?php if (@$b->stt == "0" || @$b->stt == ""): ?>
                            <strong> Waiting for confirm </strong>
                        <?php endif; ?>
                        <?php if (@$b->stt == "1"): ?>
                            <strong> Delivering </strong>
                        <?php endif; ?>
                        <?php if (@$b->stt == "2"): ?>
                            <strong> Paid </strong>
                        <?php endif; ?>
                    </p>
                </div>
                <div class="panel-footer">
                    <p><span>Created:</span> {{@$b->created_at}}</p>
                    <p><span>Update:</span> {{@$b->updated_at}}</p>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="{{route('bills')}}"><i class="fa fa-caret-square-o-up" style="color: #ffffff;"></i></a> Chi tiết hóa đơn
                </div>
                <div class="panel-body">
                    <?php $j = 1; ?>
                    <?php foreach (@$bd as $i): ?>
                        <span>Số thứ tự: </span><strong> {{@$j}} </strong>
                        <ul>
                            <li><span>Product: </span><strong> <a href="{{route('viewproduct',@$i->id)}}">View product {{@$i->id_product}}</a> </strong></li>
                            <li><span>Số lượng: </span><strong> {{@$i->quantity}} </strong></li>
                            <li><span>Đơn giá: </span><strong> {{@number_format(@$i->unit_price)}} </strong></li>
                        </ul>
                        <?php $j++; ?>
                    <?php endforeach; ?>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div>
    </div>
</div>
@endsection