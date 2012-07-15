package com.arunraja;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class DataObjSimple {

	@PrimaryKey
	@Persistent String key;
	@Persistent String val;
	@Persistent String val2;
	
}
