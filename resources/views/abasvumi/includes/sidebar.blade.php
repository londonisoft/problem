<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ url('/admin/dashboard') }}" class="brand-link">
        <img src="{{ asset('abasvumi/admin/images/logo.png') }}" width="100%" height="80px"/>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <nav>
        <ul class="nav nav-pills nav-sidebar flex-column nav-flat" data-widget="treeview" role="menu" data-accordion="false">
            
            <li class="nav-item">
            <a href="{{ url('/admin/dashboard') }}" class="nav-link dashboard">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>Dashboard</p>
            </a>
            </li>
            <li class="nav-item has-treeview settings">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-cog"></i>
                    <p>
                    Configuration
                    <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('division.index')}}" class="nav-link nav-division">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Division</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('district.index')}}" class="nav-link nav-district">
                        <i class="far fa-circle nav-icon"></i>
                        <p>District</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('thana.index') }}" class="nav-link nav-thana">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Thana</p>
                    </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('admin/brand') }}" class="nav-link nav-brand">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Brand</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('admin/slider') }}" class="nav-link nav-slider">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Sliders</p>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview common-service">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>All Amenities<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('education.index') }}" class="nav-link nav-education">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Education</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('religious.index') }}" class="nav-link nav-religious">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Religious</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('hospital.index')}}" class="nav-link nav-hospital">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Hospitals</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('park.index')}}" class="nav-link nav-park">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Park</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('restaurant.index')}}" class="nav-link nav-restaurant">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Restaurants</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('video.index')}}" class="nav-link nav-video">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Video</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('amenitie.index')}}" class="nav-link nav-amenitie">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Amenities</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview properties">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Properties<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('block.index') }}" class="nav-link nav-block">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Blocks</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('propertytype.index') }}" class="nav-link nav-property-type">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Property Type</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('property.index') }}" class="nav-link nav-property">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Properties</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('propertyContact.index') }}" class="nav-link nav-property">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Property Contact</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview products">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Products<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('productCategory.index') }}" class="nav-link nav-pro-cat">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Category</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('product.index') }}" class="nav-link nav-pro">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Product</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview services">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Services<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('serviceCategory.index') }}" class="nav-link nav-ser-cat">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Category</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('service.index') }}" class="nav-link nav-services">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Service</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview realtor">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Realtor<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('agent.index') }}" class="nav-link nav-agent">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Agents</p>
                        </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('developer.index') }}" class="nav-link nav-developer">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Developers</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('supplier.index') }}" class="nav-link nav-supplier">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Supplier</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview areas">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Areas And Place<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('area.index') }}" class="nav-link nav-area">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Area</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('areaguide.index') }}" class="nav-link nav-area-guide">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Area guide</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('dhNeibor.index') }}" class="nav-link nav-neibors-dhaka">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Dhaka Neibors</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('dhNeiborArea.index') }}" class="nav-link nav-popular-dhaka">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Dhaka Neibors Area</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview users">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Users<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('role.index') }}" class="nav-link nav-role">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Role</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('user.index') }}" class="nav-link nav-admin">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('systemUser.index') }}" class="nav-link nav-system-user">
                            <i class="far fa-circle nav-icon"></i>
                            <p>System User</p>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-swatchbook"></i>
                    <p>Blogs<i class="fas fa-angle-left right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                    <a href="{{ route('category.index') }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Category</p>
                    </a>
                    </li>
                    <li class="nav-item">
                    <a href="{{ route('blog.index') }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Blog</p>
                    </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="{{ route('testimonial.index') }}" class="nav-link">
                    <i class="nav-icon fas fa-users"></i>
                    <p>Testimonials</p>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('setting.index') }}" class="nav-link">
                    <i class="nav-icon fas fa-users"></i>
                    <p>Settings</p>
                </a>
            </li>
            
        </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>