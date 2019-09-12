Ext.define('HT.view.New', {
    extend: 'Ext.tab.Panel',
    alias:'widget.new',
    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'button',
                    text: 'MyButton'
                },
                {
                    xtype: 'splitbutton',
                    text: 'MyButton'
                }
            ]
        });

        me.callParent(arguments);
    }

});