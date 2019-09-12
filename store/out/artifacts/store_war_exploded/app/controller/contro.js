Ext.Loader.setConfig({enable:true}) ; //动态加载配置
Ext.define('Ext.controller.contro',{
       extend:'Ext.app.Controller',   //继承
       views:[
           'Accordion',
           'Bottom',
           'Center',
           'Form',
           'Grid',
           'Top'
       ],
    stores:[
        'Users'
    ],
    models:[
        'User'
    ],
    refs:[{
        ref:'tab',
        selector:'center'
    }],
     init:function(){
         this.control({
             'Accordion button[id=homePageSet]':{
                  click: function () {
                      var  tab=this.getTab.getComponent('');
                      if(!tab){

                      }

                  }
             }
         })
     }
});