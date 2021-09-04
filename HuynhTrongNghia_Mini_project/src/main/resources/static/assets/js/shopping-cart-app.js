const app = angular.module("shopping-cart-app",[]);

app.controller("shopping-cart-ctrl",function($scope,$http){
	/*
	* Quản lý giỏ hàng
	*/
	$scope.cart={
		items:[],
		//Thêm sản phẩm vào giỏ hàng
		add(id){
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;
				this.saveToLocalStorage();
			}
			else{
				$http.get(`/rest/products/${id}`).then(resp=>{
					resp.data.qty =1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
			
		remove(id){
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		//Xóa sạch các mặt hàng trong giỏ
		clear(){
			this.items = []
			this.saveToLocalStorage();
		},
		//Tính thành tiền của 1 sản phẩm
		atm_of(item){},
		//Tính Tổng số lượng các mặt hàng trong giỏ
		get count(){
			return this.items
			.map(item => item.qty)
			.reduce((total, qty)=> total += qty, 0);
		},
		//Tổng Thành tiền các mặt hàng trong giỏ
		get amount(){
			return this.items
			.map(item => item.qty*item.price)
			.reduce((total, qty) => total +=qty,0);
		},
		//Lưu giỏ hàng vào local storage
		saveToLocalStorage(){
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart",json);
		},
		//Đọc giỏ hàng từ local storage
		loadFromLocalStorage(){
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json): [];
		}
	}
	$scope.cart.loadFromLocalStorage();
	
	$scope.order ={
		createDate: new Date(),
		address:"",
		account:{username: $("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item =>{
				return{
					product:{id: item.id},
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase(){
			var order = angular.copy(this);
			//Thực hiện đặt hàng
			$http.post("/rest/orders",order).then(resp => {
				alert("Đặt hàng thành công!");
				$scope.cart.clear();
				location.href="/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
			})
		}
	}
	$scope.create=function(){
		var item = angular.copy($scope.form);
		$http.post('/rest/accounts',item).then(resp => {
			alert("Thêm mới  thành công!");
		}).catch(error => {
			alert("Lỗi Thêm mới !");
			console.log("Error", error);
		})
	}
	$scope.imageChanged=function(files){
		var data =  new FormData();
		data.append('file',files[0]);
		$http.post('/rest/upload/images',data,{
			transformRequest: angular.identity,
			headers:{'Content-Type':undefined}
		}).then(resp => {
			$scope.form.photo = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh");
			console.log("Error",error);
		}) 
	}
	$scope.dmk = function(){
		var item = angular.copy($scope.form);
		var username = $("#username").text();
		$http.get(`/rest/accounts/${username}`).then(resp => {
			item = resp.data;
			if (item.password == $scope.form.password){
				if ($scope.form.newPass= $scope.form.confirm){
					item.password = $scope.form.newPass;
					$http.put(`/rest/accounts/${username}`,item).then(resp => {
						alert("Mật Khẩu Mới Của Bạn : "+ item.password)
					})
				}else{
					alert("Nhập lại mật khẩu không đúng")
				}
			}else{
				alert("Sai Mật khẩu hoặc tài khoản")
			}
			$scope.form = {};
		})
	}
	
})