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
                    <strong>Product types [{{$s}}]</strong>
                </div>
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            @include('mess')
                            <form class="form" method="post" action="{{route('types')}}">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <div class="row">
                                    <div class="col-md-2 col-sm-3 col-xs-4">
                                        <span class="input-group">
                                            <a class="btn btn-default" href="{{route('addtype')}}">
                                                <i class="fa fa-plus"></i> Add new
                                            </a>
                                        </span>
                                    </div>
                                    <div class="col-md-2 col-sm-3 col-xs-4">
                                        <div class="form-group input-group">
                                            <select name="perpagetype" class="form-control">
                                                <option value="3"
                                                <?php
                                                if (@Session::get('perpagetype') == "3") {
                                                    echo 'selected="true"';
                                                }
                                                ?>
                                                        >3 / page</option>
                                                <option value="5"
                                                <?php
                                                if (@Session::get('perpagetype') == "5") {
                                                    echo 'selected="true"';
                                                }
                                                ?>
                                                        >5 / page</option>
                                                <option value="10"
                                                <?php
                                                if (@Session::get('perpagetype') == "10") {
                                                    echo 'selected="true"';
                                                }
                                                ?>
                                                        >10 / page</option>
                                            </select>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit">
                                                    <i class="fa fa-filter"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-sm-6 col-xs-8">
                                        <div class="form-group input-group">
                                            <input name="searchtype" value="{{Session('searchtype')}}" type="text" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <br>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
                                        <thead>
                                            <tr role="row">
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Picture</th>
                                                <th>Description</th>
                                                <th>Arrange</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                        </thead>
                                        <tbody>
                                            @foreach($xs as $x)
                                            <tr class="gradeA odd" role="row">
                                                <td>{{@$x->id}}</td>
                                                <td><a href="{{route('viewtype',@$x->id)}}">{{@$x->name}}</a></td>
                                                <td><img style="max-width: 100px;" src="{{asset('images/type/'.$x->image)}}" alt="{{$x->name}}"/></td>
                                                <td><?php echo @$x->description; ?></td>
                                                <td class="center">
                                                    <?php if (@$x->stt == "OFF"): ?>
                                                        <a href="{{route('sttType',$x->id)}}"><i class="fa fa-toggle-off fa-2x"></i></a>
                                                    <?php endif; ?>
                                                    <?php if (@$x->stt == "ON"): ?>
                                                        <a href="{{route('sttType',$x->id)}}"><i class="fa fa-toggle-on fa-2x"></i></a>
                                                    <?php endif; ?>
                                                </td>
                                                <td class="center"><a href="{{route('edittype_',$x->id)}}"><i class="fa fa-edit fa-2x"></i></a></td>
                                                <td class="center"><a href="{{route('deltype',$x->id)}}"><i class="fa fa-trash-o fa-2x"></i></a></td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <?php echo $xs->links(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection