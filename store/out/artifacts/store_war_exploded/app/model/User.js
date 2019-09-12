Ext.define('HT.model.User',   //定义的类名
	{
		//不要忘了继承
		extend:'Ext.data.Model',
		fields:[
		        {name:'uid',mapping:'uid'},    //mapping与数据做匹配解析用  用于连接data和store
		        {name:'name',mapping:'name'},
		        {name:'gender',mapping:'gender'},
		        {name:'email',mapping:'email'},
		        {name:'birthday',mapping:'birthday',type:'date',dataFormat:'Y-m-d'}
		]
	}
);