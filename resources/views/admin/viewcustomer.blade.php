@extends('admin_master')
@section('admin_content')
<div id="page-wrapper" style="min-height: 295px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="{{route('customers')}}"><i class="fa fa-caret-square-o-up" style="color: #ffffff;"></i></a> Customer infor
                </div>
                <div class="panel-body">
                    <p>
                        <span>Customer ID: </span><strong> {{@$x->id}} </strong>
                    </p>
                    <p>
                        <span>Full name: </span><strong> {{@$x->name}} </strong>
                    </p>
                    <p>
                        <span>Email: </span><strong> {{@$x->email}} </strong>
                    </p>
                    <p>
                        <span>Phone number: </span><strong> {{@$x->phone}} </strong>
                    </p>
                    <p>
                        <span>Address: </span><strong> {{@$x->address}} </strong>
                    </p>
                    <p>
                        <span>Status: </span><strong> {{@$x->stt}} </strong>
                    </p>
                </div>
                <div class="panel-footer">
                    <p><span>Created at:</span> {{@$x->created_at}}</p>
                    <p><span>Update:</span> {{@$x->updated_at}}</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection