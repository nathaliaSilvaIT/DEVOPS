package ca.georgebrown.comp2074.lab9;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.io.FileInputStream;

public class WordsDbHelper extends SQLiteOpenHelper {

  public static final int DATABASE_VERSION = 2;
  public  static final String DATABASE_NAME =
          "Words.db";

  //constructor

  public WordsDbHelper(Context context){
    super(context, DATABASE_NAME,null, DATABASE_VERSION);
  }


  @Override
  public void onCreate(SQLiteDatabase db) {
      db.execSQL(WordContract.SQL_CREATE_WORDS);
  }

  @Override
  public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
      db.execSQL(WordContract.SQL_DROP_WORDS);
      onCreate(db);
  }
}
