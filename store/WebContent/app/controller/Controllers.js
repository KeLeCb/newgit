Ext.Loader.setConfig({enabled:true});           //动态加载配置
Ext.define('HT.controller.Controllers',{
		extend:'Ext.app.Controller',   //继承 controller
		views:[                          //连接所有的视图
			'Accordion',
			'Center',
			'Top',
			'Bottom',
			'Form',
			'Grid'
		],
		stores:[                         //获取其所需要的数据
		        'Users'
		],
		models:[                         //获取模型
		      'User'
		],
		//查找到组件   相当于get方法
		refs:[{
		      	ref:'tab',  //extjs 中的插件   参考名称
		      	//找到center
		      	selector:'center'  //访问组件的选择器
			}
		],
		init:function(){
			this.control({   //ext 自带的方法
					//首先找到accordion，然后找到button组件中id=button1的组件
	            	'accordion button[id = homePageSet]':{  //使用组合选择器 选中按钮
		            		click:function(){
		            			//alert(o.text),
		            			//通过ref查找到并且进行操作
                                /*var tab = this.getTab().getComponent('homeSet');
								alert("456"+tab)
                                if(!tab)
                                {*/
		            				this.getTab().add({
			            				title:'首页设置',
		            					id:'homeSet',
		            					//加载修改首页内容的form表单页面 将setHomePage修改到form表单中
		            					html:"<iframe scrolling='auto' frameborder='0' width='100%' height='100%' src='setHomePage.html'></iframe>",
		            					//可以被关闭
		            					closable:true,
		            					//自动销毁
		            					autoDestroy:true
		            				});
                                    //设置id为“homeSet”的活动页  点击时跳转至此页
                                   this.getTab().setActiveTab('homeSet');
								/*  }else
                                {
                                    this.getTab().setActiveTab('homeSet');
                                }*/
		            		}
	            	},
	            	'accordion button[id = adminSet]':{
	            		click:function(o){
	            			var grids = new HT.view.Grid(); //直接调用定义的grid
	            			//alert(forms);
	            			//alert(o.text);
                               /* var tab = this.getTab().getComponent('adminSetTab');
							alert("65464"+tab);
                                if(!tab)
                                {*/
                                    this.getTab().add({
                                        title:'管理员设置',
                                        id:'adminSetTab',
                                        items:[grids],
                                        closable:true,
                                        closeAction:'destory',
                                        autoDestory:true
                                    });
                                    //设置id为“adminSet”的活动页 点击时跳转至此页
                                    this.getTab().setActiveTab('adminSetTab');
							/*  }else
                                    this.getTab().setActiveTab('adminSetTab');*/
	            		}
	            	},
	            	'center > panel[id = adminSetTab] button[id = addButton]':{
						//添加按钮的触发事件
	            		click:function(o){
	            			alert(o.text);
	            		}
	            	},
	            	'center > panel[id = adminSetTab] button[id = deleteButton]':{
	            		click:function(o){
	            			alert(o.text);
	            		}
	            	},
	            	'center > panel[id = adminSetTab] button[id = updateButton]':{
	            		click:function(o){
	            			alert(o.text);
	            		}
	            	}
	         });
		}
	}
);