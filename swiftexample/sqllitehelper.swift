//
//  sqllitehelper.swift
//  swiftexample
//
//  Created by shan2 on 27/10/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

import UIKit


class sqllitehelper: NSObject {
    
    
let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    
    

    
    
    func dbInsert(values: NSMutableDictionary, tableName : NSString)->Int8
    {
        var Keys : NSArray = values.allKeys;
        var columnKeys : NSString = "";
        var columnValues : NSString = "";
        
        
        for var index = 0; index < Keys.count; index++
        {
            var ks:String=Keys.objectAtIndex(index) as String
            var vs:String=values.objectForKey(ks) as String
            
            columnKeys      = NSString(format:"%@%@,",columnKeys,ks)
            columnValues    = NSString(format:"%@%@,",columnValues,vs)
        }
        
        columnValues = columnValues.substringWithRange(NSRange(location: 0, length:columnValues.length-1))
        columnKeys = columnKeys.substringWithRange(NSRange(location: 0, length:columnKeys.length-1))

        
        var insertQuery : NSString = "INSERT INTO " + tableName + "(" + columnKeys + ") VALUES(" + columnValues + ")"

        var cSql=insertQuery as String
        var result:CInt=0
        var stmt:COpaquePointer = nil
        
        result = sqlite3_prepare_v2(appDelegate.database, cSql, -1, &stmt, nil);
        if result != SQLITE_OK
        {
            return 0
        }
        else
        {
            result = sqlite3_step(stmt)
            if(result==SQLITE_DONE){
                return 1
            }
            else{
                return 0
            }
        }
      
    }
    func dbUpdate(values: NSMutableDictionary, tableName : NSString, condition : NSString)->Int8
    {
        
        
        var Keys : NSArray = values.allKeys;
   
        var updateValues : NSString = "";
        for var index = 0; index < Keys.count; index++
        {
            var ks:String=Keys.objectAtIndex(index) as String
            var vs:String=values.objectForKey(ks) as String
            
            updateValues = NSString(format:"%@ %@=%@,",updateValues, ks,vs)
            
        }

        
        
        updateValues = updateValues.substringWithRange(NSRange(location: 0, length:updateValues.length-1))
    
        var updatequery : NSString = "UPDATE " + tableName + " SET " + updateValues + " WHERE " + condition
        var cSql=updatequery as String
        var result:CInt=0
        var stmt:COpaquePointer = nil
        
        
      // println(updatequery)
        
        
        result = sqlite3_prepare_v2(appDelegate.database, cSql, -1, &stmt, nil);
        if result != SQLITE_OK
        {
            return 0;
        }
        else
        {
            result = sqlite3_step(stmt)
            if(result==SQLITE_DONE){
                return 1;
            }
            else{
                return 0;
            }
        }
    }
    func dbDelete(deleteQuery:NSString)->Int8
    {
        
        var cSql = deleteQuery as String
        var result:CInt=0
        var stmt:COpaquePointer = nil
        result = sqlite3_prepare_v2(appDelegate.database, cSql, -1, &stmt, nil);
        if result != SQLITE_OK
        {
           return 0
        }
        else
        {
            result = sqlite3_step(stmt)
            if(result==SQLITE_DONE){
                return 1
            }
            else{
                return 0
            }
        }
    }
    func dbSelect(selectQuery: NSString)->NSArray
    {
       
        var cSql:String = selectQuery as String
        var result:CInt=0
        var array_data = NSMutableArray()
        var stmt:COpaquePointer = nil
        result = sqlite3_prepare_v2(appDelegate.database, cSql, -1, &stmt, nil);
        if result != SQLITE_OK
        {
            println("failed  \(sqlite3_errmsg(appDelegate.database))")
        }
        else
        {
            result = sqlite3_step(stmt)
            array_data.removeAllObjects()
            
            while result == SQLITE_ROW {
               
                
              //  let name = sqlite3_column_text(stmt, 0)
                var count : Int32 = sqlite3_column_count(stmt);
                var Dictionary = NSMutableDictionary()
                

                for var i:Int32 = 0; i < count; i++
                {
                    var val : String = String.fromCString(UnsafePointer<Int8>(sqlite3_column_text(stmt, i)))!
                    var key : String = String.fromCString(UnsafePointer<Int8>(sqlite3_column_name(stmt, i)))!
                    
                
                    
                     Dictionary.setObject(val, forKey: key)
                }
               array_data .addObject(Dictionary)
                
    
            
                result = sqlite3_step(stmt)
                
            }
        }
        
 
        return array_data
    }
}
