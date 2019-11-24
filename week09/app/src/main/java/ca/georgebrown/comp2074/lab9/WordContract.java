package ca.georgebrown.comp2074.lab9;

import android.provider.BaseColumns;

public final class WordContract {

  //we wont initiatie this class, everything will be static

  private WordContract(){}; //constructor

  //definition of tables. Tables are classes

  public static class WordEntity implements BaseColumns{
    //baseColumns is an interface

    public static final String TABLE_NAME = "words";         //table
    public static final String COLUMN_NAME_WORD1 = "word1";   //column 1
    public static final String COLUMN_NAME_WORD2 = "word2";   //column 2


  }


  public static final String SQL_CREATE_WORDS = "CREATE TABLE "+
    WordEntity.TABLE_NAME+" ( "+
    WordEntity._ID+" INTEGER PRIMARY KEY, "+
    WordEntity.COLUMN_NAME_WORD1+" TEXT, "+
    WordEntity.COLUMN_NAME_WORD2+" TEXT )";

  public  static final String SQL_DROP_WORDS =
    "DROP TABLE IF EXISTS "+WordEntity.TABLE_NAME;
}
