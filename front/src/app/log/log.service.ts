import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Country } from '../interfaces/country';
import { User } from '../interfaces/user';

@Injectable({
  providedIn: 'root'
})
export class LogService {

  private usersUrl = environment.serverUrl + '/GetUsers.php';
  private countriesUrl = environment.serverUrl + '/GetCountries.php';
  private sendLogUrl = environment.serverUrl + '/SendLog.php';
  
  constructor(private http: HttpClient) { }

  getCountrys(): Observable<Country[]> {
    return this.http.get<Country[]>(this.countriesUrl).pipe(
      tap(_ => console.log('getCountrys')),
      catchError(this.handleError<Country[]>('getCountrys', []))
    );
  }
  

  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.usersUrl).pipe(
      tap(_ => console.log('getUsers')),
      catchError(this.handleError<User[]>('getUsers', []))
    );
  }

  filterLogs(dateFrom : string, dateTo: string, cntId :number | undefined , usrId : number| undefined) :  Observable<any>  {
    const headers = new HttpHeaders({
   });
    const params = new HttpParams()
    .set('date_from', encodeURIComponent(new Date(dateFrom).toISOString()))
    .set('date_to', encodeURIComponent(new Date(dateTo).toISOString()))
    .set('cnt_id', cntId ? cntId.toString() : '')
    .set('usr_id', usrId ? usrId.toString() : '');

    return this.http.get(this.sendLogUrl, {headers, params  }).pipe(
      tap(_ => console.log('filterLogs')),
      catchError(this.handleError<[]>('filterLogs', []))
    );
  }

  private handleError<T>(operation = 'operation', result?: T) {
  return (error: any): Observable<T> => {
    // TODO: send the error to remote logging infrastructure
    console.error(error); // log to console instead
    // Let the app keep running by returning an empty result.
    return of(result as T);
  };
}
}
