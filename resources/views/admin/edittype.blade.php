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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-group input-group">
                        <span class="input-group-addon left"></span>
                        <span class="input-group-addon"><strong>Chỉnh sửa :: {{$x->id}} - {{$x->name}}</strong> - <i class="fa  fa-info"></i></span>
                        <span class="input-group-addon right"></span>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form" action="{{route('edittype')}}" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                        <input type="hidden" name="id" value="{{$x->id}}">
                        @include('mess')
                        <div class="form-group">
                            <label>Type name:</label>
                            <input class="form-control" name="name" type="text" value="{{$x->name}}" placeholder="Product type name">
                        </div>
                        <div class="form-group">
                            <label>Picture:</label>
                            <image src="{{asset('images/type/'.$x->image)}}" style="max-height: 150px; margin: 10px;">
                            <input name="old_image" type="hidden" value="{{$x->image}}">
                            <input class="form-control" name="image" type="file">
                        </div>
                        <div class="form-group">
                            <label>Status:</label>
                            <select name="stt" class="form-control">
                                <?php if ($x->stt == "ON"): ?>
                                    <option value="ON" selected="true">ON</option>
                                    <option value="OFF">OFF</option>
                                <?php else: ?>
                                    <option value="ON">ON</option>
                                    <option value="OFF" selected="true">OFF</option>
                                <?php endif; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Description:</label>
                            <textarea id="demo" class="form-control ckeditor" name="description" placeholder="Product types description" rows="5">{{$x->description}}</textarea>
                        </div>
                        <button type="submit" class="btn btn-default">Save</button>
                        <a href="{{route('types')}}" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection