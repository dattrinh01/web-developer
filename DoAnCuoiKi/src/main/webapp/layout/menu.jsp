<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<div class="sidebar">
        <ul>
            <li class="search_box_wrapper">
                <!-- <input type="search" placeholder="Search...">
                <label class="icon">
                    <i class="fa fa-search"></i>
                </label> -->
                <form action="Search" method="GET">
                <div class="search_box">
                    <input type="text" class="input" placeholder="Search..." id="search" name ="search">
                    <button type="submit" class="search_btn">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
                </form>
            </li>
            <li><a href="viewContent.tiles"><i class="fa fa-table"></i>View contents</a></li>
            <li><a href="formContent.tiles"><i class="fas fa-edit"></i>Form content</a></li>
            <li class="empty"></li>
        </ul>
</div>