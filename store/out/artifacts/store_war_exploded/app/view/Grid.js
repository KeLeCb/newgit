Ext.define('HT.view.Grid',{
    extend:'Ext.grid.Panel',
    infinite:false,
    title : '人员列表',
    id:'userGrid',
    closeAction:'destory',   //关闭时自动销毁
    initComponent:function(){

        //创建可编辑插件
        var cellEditing = Ext.create('Ext.grid.plugin.CellEditing',{
            //表示双击才可以编辑
            clicksToEdit:2
        });
        //创建多选框
        var checkBox = Ext.create('Ext.selection.CheckboxModel');

        var sexStore = Ext.create(
            'Ext.data.Store',
            {
                fields:['id','name'],
                data:[
                    {"id":"1","name":"男"},
                    {"id":"2","name":"女"}
                ]
            }
        );

        Ext.apply(this,{
            //layout:'fit',
            //frame:true,
            //引入store5
            width:'100%',
            height:642,
            store:'Users',
            //多选框
            selModel:checkBox,
            plugins:[cellEditing],
            tbar:[{
                xtype:'button',
                text:'添加',
                id:'addButton'
            },{
                xtype:'button',
                text:'删除',
                id:'deleteButton'
            },{
                xtype:'button',
                text:'更新',
                id:'updateButton'
            }
            ],

            columns: [//配置表格列
                //new Ext.grid.RowNumberer(),//表格行号组件
                {
                    header: "编号",
                    width: 200,
                    dataIndex: 'uid',
                    height:40,
                    sortable: true
                },
                {
                    header: "姓名",
                    width: 100,
                    dataIndex: 'name',
                    sortable: true,
                    editor:{
                        xtype:'textfield',
                        allowBlank:false
                    }
                },
                {
                    header: "邮箱",
                    width: 150,
                    dataIndex: 'email',
                    sortable: true,
                    editor:{
                        xtype:'textfield',
                        allowBlank:false
                    }
                },
                {
                    header: "性别",
                    width: 80,
                    dataIndex: 'gender',
                    sortable: true,
                    editor:{
                        xtype:'combobox',
                        store:sexStore,
                        displayField:'name',
                        valueField:'name',
                        listeners:{
                            select:function(combo,record,index){
                                isEdit = true;
                            }
                        }
                    },
                    renderer: this.autoRowHeight
                },
                {
                    header: "生日",
                    width: 200,
                    dataIndex: 'birthday',
                    sortable: true,
                    renderer:function(value){
                        return value ? Ext.Date.dateFormat(value,'Y-m-d') : '';  //采用选择事件
                    },
                    editor:{
                        xtype:'datefield',
                        format:'Y-m-d'
                    },


                }
            ],
            dockedItems: [{
                pagesize:15,
                xtype: "pagingtoolbar",
                store: 'Users',
                emptyMsg: "没有数据",
                dock: "bottom",
                displayInfo: true,
                beforePageText:'当前页',
                afterPageText:'共{0}页',
                displayMsg: '显示 {0} - {1} 条，共计 {2} 条',
            }]
        });
            this.callParent(arguments);
    },
    autoRowHeight: function(value, metaData, record, rowIndex, colIndex, store, view) {
        //ExtJS3中实现自适应行高
        /*metadata.attr = 'style="white-space:normal;"';
        return value;*/
        //ExtJS4中实现自适应行高
        return '<div style="height: 25px">' + value + '</div>'
    }

});
