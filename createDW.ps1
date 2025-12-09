#This script will create/recreate the QASQLETLDW Database

#Create the folders to store the .mdf and .ldf files

if (-not (test-path -Path f:\sqletldb -PathType Container))
{
    New-Item -Path f:\sqletldb -ItemType Directory
}


if (-not (test-path -Path g:\sqletlLogs -PathType Container))
{
    New-Item -Path g:\sqletlLogs -ItemType Directory
}

#Run a SQL script to Create the Data Warehouse

Invoke-Sqlcmd -InputFile '.\create DW Script.sql'