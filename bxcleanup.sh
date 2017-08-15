#!/bin/sh
##############################################################################
# This script is designed to offer basic support to control costs when running
# a paid Bluemix account
#
# Required parameters: API key file
# Contact: eanderso@us.ibm.com
##############################################################################

bx login -apikey $1;

orgs=`bx iam orgs | grep active | awk '{print $1}'`;

#To Display all the Orgs use: echo $orgs

#Loop through all of the orgs
for i in $orgs
  {

    echo `date`;
    echo "Targeting org: "$i".";
    bx target -o $i;

    spaces=`bx iam spaces | tail -n +6`;

    for j in $spaces
      {
            echo "Targeting space: "$j".";
            bx target -s $j;

      }




  }