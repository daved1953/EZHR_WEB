
# EZHR_WEB
EZHR_Web application
This is the source and research files for the TRAnton EZHR web site.


 Code used for record id  - VB.Net version:
   'Place All House Cleaning in here clear all array for channel leaving
        Dim Chnl As Integer
        Dim Ser As String 'Temporary Serial number for linking database tables


        Chnl = e.channel
        Conf(Chnl) = ""
        Ser = Format(Now(), "ddyyssmmMMHH")
        tmpConNum(Chnl) = "NC" & LTrim(Str(Chnl)) & "-" & Ser

        'add a new row into the Reportdata table
        'Reprow(Chnl) = MyResData3.Tables("reportdata").NewRow()
        'Reprow(Chnl)("Confirmation") = tmpConNum(Chnl)
        'Reprow(Chnl)("CallDate") = Now()
        'MyResData3.Tables("ReportData").Columns.Item
        Reprow(Chnl) = Myrepdata1.Tables("ReportData").NewRow()
        recordRepData(e.channel, "CallID", tmpConNum(Chnl))
        recordRepData(e.channel, "CallDate", Now())

        'Dim i As Integer
        'Dim itmz As Integer = MyResData3.Tables("ReportData").Columns.Count - 1
        'For i = 0 To itmz   'Clears Current Channel array
        '    repdata(Chnl, 0, i) = ""
        '    repdata(Chnl, 1, i) = ""
        'Next
        'repdata(Chnl, 0, 2) = "CallDate"
        'repdata(Chnl, 1, 2) = CStr(Now())
        'repdata(Chnl, 0, 6) = "Confirmation"
        'repdata(Chnl, 1, 6) = tmpConNum(Chnl)

        LineGroup1.PlaySpeed(Chnl) = SpeedControl.Value
        LineGroup1.PlayVolume(Chnl) = VolumeControl.Value
        NxtQID(Chnl) = 5003
        QProc(Chnl)     
        
       -----   how it gets stored ----
           Public Shared Reprow(5) As DataRow
     Sub recordRepData(ByVal Chnl As Integer, ByVal field As String, ByVal repd As Object)
        Reprow(Chnl)(field) = repd
     
      
    End Sub	 
	   
	    Sub RecordData(ByVal Chnl)
        'Dim RDrow As DataRow
        ' record the response to temp table based on channel name
        'Dim RDtable As New myresdata.RespdataDataTable()
        RDrow(Chnl) = Myresdata3.Tables("respdata").NewRow()
        RDrow(Chnl)("CallID") = tmpConNum(Chnl)
        RDrow(Chnl)("QID") = QID(Chnl)
        RDrow(Chnl)("Dcollect") = QID(Chnl) + "." + LTrim(Str(Dindex(Chnl)))
        Myresdata3.Tables("Respdata").Rows.Add(RDrow(Chnl))


        'myRepAdapt.Update(MyResData3, "Respdata")

    End Sub