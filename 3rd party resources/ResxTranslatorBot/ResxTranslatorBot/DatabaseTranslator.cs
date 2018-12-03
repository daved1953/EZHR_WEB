using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ResxTranslator
{
    public partial class DatabaseTranslator : Form
    {
        private ClsDatabase clsDB; 
        public DatabaseTranslator()
        {
            InitializeComponent();
            foreach (string key in Translator.LanguageNamesList.Keys)
            {
                listLanguages.Items.Add(key, Settings.GetIfLanguageIsTranslated(key));
            }
        }

        private void groupBoxServerData_Enter(object sender, EventArgs e)
        {

        }

        private void buttonLoadDatabsaeConnection_Click(object sender, EventArgs e)
        {

        }

        private void buttonLoadTablesList_Click(object sender, EventArgs e)
        {
            clsDB = new ClsDatabase(txtPastedConn.Text);

            List<String> odbname = clsDB.GetTables();

            foreach (var otname in odbname)
            {
                cmbTableList.Items.Add(otname);

            }
        }

        private void buttonUseThisTableForConversions_Click(object sender, EventArgs e)
        {
            clsDB = new ClsDatabase(txtPastedConn.Text);

            List<String> odbname = clsDB.GetColumns( cmbTableList.Text );

            foreach (var otname in odbname)
            {
                
               cmbSourceColumn.Items.Add(otname);
               cmbTargetColumn.Items.Add(otname);

            }
        }
    }
}
