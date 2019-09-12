Ext.define('HT.store.Users',{   // 类似于实体类的使用
	//不要忘了继承
	extend:'Ext.data.Store',  //继承
	//记得设置model
	model:'HT.model.User',  //model 模型
	//自动加载设为true
	autoLoad:true,
    pageSize: 15,
    autoLoad: { start: 0, limit: 15 },
    proxy: new Ext.data.HttpProxy({ // 由 extjs 框架函数代替ajax 进行接收数据
        url:"UserServlet?method=select",
        method: 'POST',
        jsonData: {CurPageIndex: 0 },
        reader: {
            type: "json",
            rootProperty: 'rows',       //后台接收到的数据值
            totalProperty: 'total',     //后台传过来的参数
        }
    })
});