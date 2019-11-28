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
                        <span class="input-group-addon"></span>
                        <span class="input-group-addon"><Strong>Add new</Strong> - <i class="fa  fa-info"></i></span>
                        <span class="input-group-addon"></span>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form" action="{{route('addtype')}}" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                        @include('mess')
                        <div class="form-group">
                            <label>Type name:</label>
                            <input class="form-control" name="name" type="text" placeholder="Product type name">
                        </div>
                        <div class="form-group">
                            <label>Picture:</label>
                            <input class="form-control" name="image" type="file">
                        </div>
                        <div class="form-group">
                            <label>Status:</label>
                            <select name="stt" class="form-control">
                                <option value="ON">ON</option>
                                <option value="OFF">OFF</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Description:</label>
                            <textarea id="demo" class="form-control ckeditor" name="description" placeholder="Product type description" rows="5"></textarea>
                        </div>
                        <button type="submit" class="btn btn-default">Add new</button>
                        <a href="{{route('types')}}" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection