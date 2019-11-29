@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9 row-container">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Home</a></li>
                    <li class="active"><span class="divider">/</span> Product</li>
                </ul>
                <form class="form-inline navbar-search" method="post" action="{{route('search')}}" style="float:right;">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <input name="keysearch" type="text" value="{{Session('keysearch')}}" placeholder="Search product"/>
                    <input class="btn" type="submit" value="Search">
                </form>
                <form class="form-inline navbar-search" method="post" action="{{route('sort')}}">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <select name="sort">
                        <option value="name_ASC"
                        <?php
                        if (@Session::get('sort') == "name_ASC") {
                            echo 'selected="true"';
                        }
                        ?>
                                >Sort by name A - Z</option>
                        <option value="name_DESC"
                        <?php
                        if (@Session::get('sort') == "name_DESC") {
                            echo 'selected="true"';
                        }
                        ?>
                                >Sort by name Z - A</option>
                        <option value="unit_price_ASC"
                        <?php
                        if (@Session::get('sort') == "unit_price_ASC") {
                            echo 'selected="true"';
                        }
                        ?>
                                >Sort by price Ascending</option>
                        <option value="unit_price_DESC"
                        <?php
                        if (@Session::get('sort') == "unit_price_DESC") {
                            echo 'selected="true"';
                        }
                        ?>
                                >Sort by price Descending</option>
                        <option value="promotion_price_DESC"
                        <?php
                        if (@Session::get('sort') == "promotion_price_DESC") {
                            echo 'selected="true"';
                        }
                        ?>
                                >Hot price</option>
                    </select>
                    <select name="perpage">
                        <option value="9"
                        <?php
                        if (@Session::get('perpage') == "9") {
                            echo 'selected="true"';
                        }
                        ?>
                                >9 products per page</option>
                        <option value="12"
                        <?php
                        if (@Session::get('perpage') == "12") {
                            echo 'selected="true"';
                        }
                        ?>
                                >12 products per page</option>
                        <option value="24"
                        <?php
                        if (@Session::get('perpage') == "24") {
                            echo 'selected="true"';
                        }
                        ?>
                                >24 products per page</option>
                        <option value="100"
                        <?php
                        if (@Session::get('perpage') == "100") {
                            echo 'selected="true"';
                        }
                        ?>
                                >100 products per page</option>
                        <option value="500"
                        <?php
                        if (@Session::get('perpage') == "500") {
                            echo 'selected="true"';
                        }
                        ?>
                                >500 products per page</option>
                    </select>
                    <input class="btn" type="submit" value="Sort">
                </form>
                <br class="clr"/><br class="clr"/>
                <div id="myTab">
                    <a href="#listView" data-toggle="tab"><span class="btn"><i class="icon-list"></i> List view</span></a>
                    <a href="#blockView" data-toggle="tab"><span class="btn"><i class="icon-th-large"></i>Grid view</span></a>
                </div>
                <br class="clr"/>
                <div class="tab-content">
                    <div class="tab-pane" id="listView">
                        @foreach($products as $p)
                        <div class="row">
                            <div class="span2" style="margin: 15px;">
                                <img style="height: 150px; width: 100%;" src="{{asset('images/product/'.$p->image)}}" alt="<?php echo $p->name; ?>"/>
                            </div>
                            <div class="content pull-leftt">
                                <strong>
                                    <?php echo $p->name; ?>
                                </strong>
                                <div>
                                    @if($p->promotion_price==0)
                                    <p>Price: $<?php echo number_format($p->unit_price); ?>{{@Session::get('unit')->value}}</p>
                                    @else
                                    <p style="text-decoration: line-through;">Price: $<?php echo number_format($p->unit_price); ?>{{@Session::get('unit')->value}}</p>
                                    <p>Now only: $<?php echo number_format($p->promotion_price); ?>{{@Session::get('unit')->value}}</p>
                                    @endif
                                </div>
                                <a href="{{route('product-detail',@$p->id)}}" class="btn"><i class="icon-zoom-in"></i> Learn more</a>
                                <a href="{{route('addtocart',$p->id)}}" class="btn"><i class=" icon-shopping-cart"></i> Add to cart</a>
                            </div>
                        </div>
                        <hr class="soft"/>
                        @endforeach
                    </div>
                    <div class="tab-pane active" id="blockView">
                        <ul class="thumbnails">
                            @foreach($products as $p)
                            <li class="span3">
                                <div class="thumbnail">
                                    @if($p->promotion_price>0)
                                    <i class="tag"></i>
                                    @endif
                                    <a href="{{route('product-detail',@$p->id)}}" title="<?php echo $p->name; ?>">
                                        <img style="height: 250px; width: 100%;" src="{{asset('images/product/'.$p->image)}}" alt="<?php echo $p->name; ?>"/>
                                    </a>
                                    <br/><br/>
                                    <div class="content">
                                        <a href="{{route('product-detail',@$p->id)}}" class="btn pull-left"><i class="icon-zoom-in"></i> Learn more</a>
                                        <a href="{{route('addtocart',$p->id)}}" class="btn pull-right"><i class=" icon-shopping-cart"></i> Add to cart</a>
                                    </div>
                                    <br class="clr"/>
                                    <div class="content" style="height:100px;">
                                        <br class="clr"/>
                                        <strong>
                                            <?php echo $p->name; ?>
                                        </strong>
                                        <div>
                                            @if($p->promotion_price==0)
                                            <p class="pull-left">Price: $<?php echo number_format($p->unit_price); ?>{{@Session::get('unit')->value}}</p>
                                            @else
                                            <p class="pull-left" style="text-decoration: line-through;">Price: $<?php echo number_format($p->unit_price); ?>{{@Session::get('unit')->value}}</p>
                                            <p class="pull-right">Now Only: $<?php echo number_format($p->promotion_price); ?>{{@Session::get('unit')->value}}</p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="pagination">
                    <?php echo $products->links(); ?>
                </div>
                <br class="clr"/>
            </div>
        </div>
    </div>
</div>
@endsection
