namespace ResxTranslator
{
    partial class DatabaseTranslator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabDBTable = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.groupBoxServerData = new System.Windows.Forms.GroupBox();
            this.groupBoxAvailableTables = new System.Windows.Forms.GroupBox();
            this.labelDatabaseServer = new System.Windows.Forms.Label();
            this.txtServerName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.lblUsername = new System.Windows.Forms.Label();
            this.labelDatabaseUserName = new System.Windows.Forms.Label();
            this.txtDBUsername = new System.Windows.Forms.TextBox();
            this.txtDBPassword = new System.Windows.Forms.TextBox();
            this.labelDatabasePassword = new System.Windows.Forms.Label();
            this.checkBoxTrustedConnection = new System.Windows.Forms.CheckBox();
            this.labelDatabaseName = new System.Windows.Forms.Label();
            this.txtDatabseName = new System.Windows.Forms.TextBox();
            this.btnCheckConnection = new System.Windows.Forms.Button();
            this.btnSaveConnection = new System.Windows.Forms.Button();
            this.buttonLoadDatabsaeConnection = new System.Windows.Forms.Button();
            this.labelUseThisConnectionString = new System.Windows.Forms.Label();
            this.txtPastedConn = new System.Windows.Forms.TextBox();
            this.cmbTableList = new System.Windows.Forms.ComboBox();
            this.buttonLoadTablesList = new System.Windows.Forms.Button();
            this.buttonUseThisTableForConversions = new System.Windows.Forms.Button();
            this.TableColumns = new System.Windows.Forms.GroupBox();
            this.cmbSourceColumn = new System.Windows.Forms.ComboBox();
            this.cmbTargetColumn = new System.Windows.Forms.ComboBox();
            this.listLanguages = new System.Windows.Forms.CheckedListBox();
            this.btnDoTranslation = new System.Windows.Forms.Button();
            this.labelSourceColumnData = new System.Windows.Forms.Label();
            this.labelColumnToStoreTranslation = new System.Windows.Forms.Label();
            this.tabDBTable.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.groupBoxServerData.SuspendLayout();
            this.groupBoxAvailableTables.SuspendLayout();
            this.TableColumns.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabDBTable
            // 
            this.tabDBTable.Controls.Add(this.tabPage1);
            this.tabDBTable.Controls.Add(this.tabPage2);
            this.tabDBTable.Location = new System.Drawing.Point(4, 13);
            this.tabDBTable.Name = "tabDBTable";
            this.tabDBTable.SelectedIndex = 0;
            this.tabDBTable.Size = new System.Drawing.Size(832, 338);
            this.tabDBTable.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.txtPastedConn);
            this.tabPage1.Controls.Add(this.labelUseThisConnectionString);
            this.tabPage1.Controls.Add(this.groupBoxAvailableTables);
            this.tabPage1.Controls.Add(this.groupBoxServerData);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(824, 312);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "DB Connection";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.TableColumns);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(824, 312);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Table selection and conversion";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // groupBoxServerData
            // 
            this.groupBoxServerData.Controls.Add(this.buttonLoadDatabsaeConnection);
            this.groupBoxServerData.Controls.Add(this.btnSaveConnection);
            this.groupBoxServerData.Controls.Add(this.btnCheckConnection);
            this.groupBoxServerData.Controls.Add(this.txtDatabseName);
            this.groupBoxServerData.Controls.Add(this.labelDatabaseName);
            this.groupBoxServerData.Controls.Add(this.checkBoxTrustedConnection);
            this.groupBoxServerData.Controls.Add(this.labelDatabasePassword);
            this.groupBoxServerData.Controls.Add(this.txtDBPassword);
            this.groupBoxServerData.Controls.Add(this.txtDBUsername);
            this.groupBoxServerData.Controls.Add(this.labelDatabaseUserName);
            this.groupBoxServerData.Controls.Add(this.lblUsername);
            this.groupBoxServerData.Controls.Add(this.label1);
            this.groupBoxServerData.Controls.Add(this.txtServerName);
            this.groupBoxServerData.Controls.Add(this.labelDatabaseServer);
            this.groupBoxServerData.Location = new System.Drawing.Point(23, 19);
            this.groupBoxServerData.Name = "groupBoxServerData";
            this.groupBoxServerData.Size = new System.Drawing.Size(314, 236);
            this.groupBoxServerData.TabIndex = 0;
            this.groupBoxServerData.TabStop = false;
            this.groupBoxServerData.Text = "Server data";
            this.groupBoxServerData.Enter += new System.EventHandler(this.groupBoxServerData_Enter);
            // 
            // groupBoxAvailableTables
            // 
            this.groupBoxAvailableTables.Controls.Add(this.buttonUseThisTableForConversions);
            this.groupBoxAvailableTables.Controls.Add(this.buttonLoadTablesList);
            this.groupBoxAvailableTables.Controls.Add(this.cmbTableList);
            this.groupBoxAvailableTables.Location = new System.Drawing.Point(356, 28);
            this.groupBoxAvailableTables.Name = "groupBoxAvailableTables";
            this.groupBoxAvailableTables.Size = new System.Drawing.Size(437, 200);
            this.groupBoxAvailableTables.TabIndex = 1;
            this.groupBoxAvailableTables.TabStop = false;
            this.groupBoxAvailableTables.Text = "Available tables";
            // 
            // labelDatabaseServer
            // 
            this.labelDatabaseServer.AutoSize = true;
            this.labelDatabaseServer.Location = new System.Drawing.Point(12, 18);
            this.labelDatabaseServer.Name = "labelDatabaseServer";
            this.labelDatabaseServer.Size = new System.Drawing.Size(85, 13);
            this.labelDatabaseServer.TabIndex = 0;
            this.labelDatabaseServer.Text = "Database server";
            // 
            // txtServerName
            // 
            this.txtServerName.Location = new System.Drawing.Point(108, 16);
            this.txtServerName.Name = "txtServerName";
            this.txtServerName.Size = new System.Drawing.Size(192, 20);
            this.txtServerName.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 47);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 2;
            // 
            // lblUsername
            // 
            this.lblUsername.AutoSize = true;
            this.lblUsername.Location = new System.Drawing.Point(64, 67);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(0, 13);
            this.lblUsername.TabIndex = 3;
            // 
            // labelDatabaseUserName
            // 
            this.labelDatabaseUserName.AutoSize = true;
            this.labelDatabaseUserName.Location = new System.Drawing.Point(12, 93);
            this.labelDatabaseUserName.Name = "labelDatabaseUserName";
            this.labelDatabaseUserName.Size = new System.Drawing.Size(105, 13);
            this.labelDatabaseUserName.TabIndex = 4;
            this.labelDatabaseUserName.Text = "Database user name";
            // 
            // txtDBUsername
            // 
            this.txtDBUsername.Location = new System.Drawing.Point(132, 93);
            this.txtDBUsername.Name = "txtDBUsername";
            this.txtDBUsername.Size = new System.Drawing.Size(176, 20);
            this.txtDBUsername.TabIndex = 5;
            // 
            // txtDBPassword
            // 
            this.txtDBPassword.Location = new System.Drawing.Point(132, 125);
            this.txtDBPassword.Name = "txtDBPassword";
            this.txtDBPassword.Size = new System.Drawing.Size(167, 20);
            this.txtDBPassword.TabIndex = 6;
            // 
            // labelDatabasePassword
            // 
            this.labelDatabasePassword.AutoSize = true;
            this.labelDatabasePassword.Location = new System.Drawing.Point(12, 128);
            this.labelDatabasePassword.Name = "labelDatabasePassword";
            this.labelDatabasePassword.Size = new System.Drawing.Size(102, 13);
            this.labelDatabasePassword.TabIndex = 7;
            this.labelDatabasePassword.Text = "Database Password";
            // 
            // checkBoxTrustedConnection
            // 
            this.checkBoxTrustedConnection.AutoSize = true;
            this.checkBoxTrustedConnection.Location = new System.Drawing.Point(15, 70);
            this.checkBoxTrustedConnection.Name = "checkBoxTrustedConnection";
            this.checkBoxTrustedConnection.Size = new System.Drawing.Size(119, 17);
            this.checkBoxTrustedConnection.TabIndex = 8;
            this.checkBoxTrustedConnection.Text = "Trusted Connection";
            this.checkBoxTrustedConnection.UseVisualStyleBackColor = true;
            // 
            // labelDatabaseName
            // 
            this.labelDatabaseName.AutoSize = true;
            this.labelDatabaseName.Location = new System.Drawing.Point(13, 47);
            this.labelDatabaseName.Name = "labelDatabaseName";
            this.labelDatabaseName.Size = new System.Drawing.Size(84, 13);
            this.labelDatabaseName.TabIndex = 9;
            this.labelDatabaseName.Text = "Database Name";
            // 
            // txtDatabseName
            // 
            this.txtDatabseName.Location = new System.Drawing.Point(113, 48);
            this.txtDatabseName.Name = "txtDatabseName";
            this.txtDatabseName.Size = new System.Drawing.Size(186, 20);
            this.txtDatabseName.TabIndex = 10;
            // 
            // btnCheckConnection
            // 
            this.btnCheckConnection.Location = new System.Drawing.Point(16, 155);
            this.btnCheckConnection.Name = "btnCheckConnection";
            this.btnCheckConnection.Size = new System.Drawing.Size(129, 27);
            this.btnCheckConnection.TabIndex = 11;
            this.btnCheckConnection.Text = "Check Conntection";
            this.btnCheckConnection.UseVisualStyleBackColor = true;
            // 
            // btnSaveConnection
            // 
            this.btnSaveConnection.Location = new System.Drawing.Point(167, 151);
            this.btnSaveConnection.Name = "btnSaveConnection";
            this.btnSaveConnection.Size = new System.Drawing.Size(132, 34);
            this.btnSaveConnection.TabIndex = 12;
            this.btnSaveConnection.Text = "Save Connection to file";
            this.btnSaveConnection.UseVisualStyleBackColor = true;
            // 
            // buttonLoadDatabsaeConnection
            // 
            this.buttonLoadDatabsaeConnection.Location = new System.Drawing.Point(15, 188);
            this.buttonLoadDatabsaeConnection.Name = "buttonLoadDatabsaeConnection";
            this.buttonLoadDatabsaeConnection.Size = new System.Drawing.Size(118, 37);
            this.buttonLoadDatabsaeConnection.TabIndex = 13;
            this.buttonLoadDatabsaeConnection.Text = "Load DatabaseConnection";
            this.buttonLoadDatabsaeConnection.UseVisualStyleBackColor = true;
            this.buttonLoadDatabsaeConnection.Click += new System.EventHandler(this.buttonLoadDatabsaeConnection_Click);
            // 
            // labelUseThisConnectionString
            // 
            this.labelUseThisConnectionString.AutoSize = true;
            this.labelUseThisConnectionString.Location = new System.Drawing.Point(6, 263);
            this.labelUseThisConnectionString.Name = "labelUseThisConnectionString";
            this.labelUseThisConnectionString.Size = new System.Drawing.Size(127, 13);
            this.labelUseThisConnectionString.TabIndex = 2;
            this.labelUseThisConnectionString.Text = "use this connection string";
            // 
            // txtPastedConn
            // 
            this.txtPastedConn.Location = new System.Drawing.Point(142, 260);
            this.txtPastedConn.Name = "txtPastedConn";
            this.txtPastedConn.Size = new System.Drawing.Size(651, 20);
            this.txtPastedConn.TabIndex = 3;
            // 
            // cmbTableList
            // 
            this.cmbTableList.FormattingEnabled = true;
            this.cmbTableList.Location = new System.Drawing.Point(6, 39);
            this.cmbTableList.Name = "cmbTableList";
            this.cmbTableList.Size = new System.Drawing.Size(229, 21);
            this.cmbTableList.TabIndex = 0;
            // 
            // buttonLoadTablesList
            // 
            this.buttonLoadTablesList.Location = new System.Drawing.Point(152, 11);
            this.buttonLoadTablesList.Name = "buttonLoadTablesList";
            this.buttonLoadTablesList.Size = new System.Drawing.Size(213, 22);
            this.buttonLoadTablesList.TabIndex = 5;
            this.buttonLoadTablesList.Text = "Load tables list";
            this.buttonLoadTablesList.UseVisualStyleBackColor = true;
            this.buttonLoadTablesList.Click += new System.EventHandler(this.buttonLoadTablesList_Click);
            // 
            // buttonUseThisTableForConversions
            // 
            this.buttonUseThisTableForConversions.Location = new System.Drawing.Point(241, 157);
            this.buttonUseThisTableForConversions.Name = "buttonUseThisTableForConversions";
            this.buttonUseThisTableForConversions.Size = new System.Drawing.Size(177, 28);
            this.buttonUseThisTableForConversions.TabIndex = 6;
            this.buttonUseThisTableForConversions.Text = "Use This table for conversions";
            this.buttonUseThisTableForConversions.UseVisualStyleBackColor = true;
            this.buttonUseThisTableForConversions.Click += new System.EventHandler(this.buttonUseThisTableForConversions_Click);
            // 
            // TableColumns
            // 
            this.TableColumns.Controls.Add(this.labelColumnToStoreTranslation);
            this.TableColumns.Controls.Add(this.labelSourceColumnData);
            this.TableColumns.Controls.Add(this.btnDoTranslation);
            this.TableColumns.Controls.Add(this.listLanguages);
            this.TableColumns.Controls.Add(this.cmbTargetColumn);
            this.TableColumns.Controls.Add(this.cmbSourceColumn);
            this.TableColumns.Location = new System.Drawing.Point(19, 18);
            this.TableColumns.Name = "TableColumns";
            this.TableColumns.Size = new System.Drawing.Size(518, 288);
            this.TableColumns.TabIndex = 0;
            this.TableColumns.TabStop = false;
            this.TableColumns.Text = "Table Columns";
            // 
            // cmbSourceColumn
            // 
            this.cmbSourceColumn.FormattingEnabled = true;
            this.cmbSourceColumn.Location = new System.Drawing.Point(20, 48);
            this.cmbSourceColumn.Name = "cmbSourceColumn";
            this.cmbSourceColumn.Size = new System.Drawing.Size(243, 21);
            this.cmbSourceColumn.TabIndex = 0;
            // 
            // cmbTargetColumn
            // 
            this.cmbTargetColumn.FormattingEnabled = true;
            this.cmbTargetColumn.Location = new System.Drawing.Point(20, 120);
            this.cmbTargetColumn.Name = "cmbTargetColumn";
            this.cmbTargetColumn.Size = new System.Drawing.Size(243, 21);
            this.cmbTargetColumn.TabIndex = 1;
            // 
            // listLanguages
            // 
            this.listLanguages.CheckOnClick = true;
            this.listLanguages.FormattingEnabled = true;
            this.listLanguages.Location = new System.Drawing.Point(326, 19);
            this.listLanguages.Name = "listLanguages";
            this.listLanguages.Size = new System.Drawing.Size(175, 199);
            this.listLanguages.TabIndex = 2;
            // 
            // btnDoTranslation
            // 
            this.btnDoTranslation.Location = new System.Drawing.Point(320, 236);
            this.btnDoTranslation.Name = "btnDoTranslation";
            this.btnDoTranslation.Size = new System.Drawing.Size(180, 33);
            this.btnDoTranslation.TabIndex = 3;
            this.btnDoTranslation.Text = "Apply Language to Target";
            this.btnDoTranslation.UseVisualStyleBackColor = true;
            // 
            // labelSourceColumnData
            // 
            this.labelSourceColumnData.AutoSize = true;
            this.labelSourceColumnData.Location = new System.Drawing.Point(18, 24);
            this.labelSourceColumnData.Name = "labelSourceColumnData";
            this.labelSourceColumnData.Size = new System.Drawing.Size(185, 13);
            this.labelSourceColumnData.TabIndex = 4;
            this.labelSourceColumnData.Text = "Source Column - data to be translated";
            // 
            // labelColumnToStoreTranslation
            // 
            this.labelColumnToStoreTranslation.AutoSize = true;
            this.labelColumnToStoreTranslation.Location = new System.Drawing.Point(18, 93);
            this.labelColumnToStoreTranslation.Name = "labelColumnToStoreTranslation";
            this.labelColumnToStoreTranslation.Size = new System.Drawing.Size(131, 13);
            this.labelColumnToStoreTranslation.TabIndex = 5;
            this.labelColumnToStoreTranslation.Text = "Column to store translation";
            // 
            // DatabaseTranslator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(848, 380);
            this.Controls.Add(this.tabDBTable);
            this.Name = "DatabaseTranslator";
            this.Text = "DatabaseTranslator";
            this.tabDBTable.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.groupBoxServerData.ResumeLayout(false);
            this.groupBoxServerData.PerformLayout();
            this.groupBoxAvailableTables.ResumeLayout(false);
            this.TableColumns.ResumeLayout(false);
            this.TableColumns.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabDBTable;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.GroupBox groupBoxAvailableTables;
        private System.Windows.Forms.GroupBox groupBoxServerData;
        private System.Windows.Forms.Label lblUsername;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtServerName;
        private System.Windows.Forms.Label labelDatabaseServer;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button buttonLoadDatabsaeConnection;
        private System.Windows.Forms.Button btnSaveConnection;
        private System.Windows.Forms.Button btnCheckConnection;
        private System.Windows.Forms.TextBox txtDatabseName;
        private System.Windows.Forms.Label labelDatabaseName;
        private System.Windows.Forms.CheckBox checkBoxTrustedConnection;
        private System.Windows.Forms.Label labelDatabasePassword;
        private System.Windows.Forms.TextBox txtDBPassword;
        private System.Windows.Forms.TextBox txtDBUsername;
        private System.Windows.Forms.Label labelDatabaseUserName;
        private System.Windows.Forms.TextBox txtPastedConn;
        private System.Windows.Forms.Label labelUseThisConnectionString;
        private System.Windows.Forms.Button buttonUseThisTableForConversions;
        private System.Windows.Forms.Button buttonLoadTablesList;
        private System.Windows.Forms.ComboBox cmbTableList;
        private System.Windows.Forms.GroupBox TableColumns;
        private System.Windows.Forms.ComboBox cmbTargetColumn;
        private System.Windows.Forms.ComboBox cmbSourceColumn;
        private System.Windows.Forms.CheckedListBox listLanguages;
        private System.Windows.Forms.Button btnDoTranslation;
        private System.Windows.Forms.Label labelColumnToStoreTranslation;
        private System.Windows.Forms.Label labelSourceColumnData;
    }
}