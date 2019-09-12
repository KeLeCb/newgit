Ext.define('HT.view.Form',{
	extend:'Ext.tab.Panel',
	alias:'widget.form',   // 别名
	title:'首页设置',
	html:'首页设置',
	id:'homeSet',
	listeners:{//当前侦听到关闭事件时，把要关闭的Panel隐藏
        remove: function(tp, c) {
            c.hide();
        }
    },
    autoDestroy:false,//被关闭的Panel不会被自动释放
	contentEl:'homeSetDiv'  //包含的内容

});