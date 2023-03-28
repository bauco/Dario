import { Component, OnDestroy, OnInit } from '@angular/core';
import { Country } from '../interfaces/country';
import { User } from '../interfaces/user';
import { LogService } from './log.service';

@Component({
  selector: 'app-log',
  templateUrl: './log.component.html',
  styleUrls: ['./log.component.scss']
})
export class LogComponent implements OnInit , OnDestroy {
  countries: Country[] = [];
  selectedCountry!: number;
  users: User[] = [];
  selectedUser!: number;
  fromDate!: string;
  toDate!: string;
  data:any;

  sub: any = [];

  constructor(private logService : LogService ) { }

  ngOnInit(): void {
    this.sub['users'] = this.logService.getUsers().subscribe(users => {
      this.users = users;
      console.log(users);
    });
    this.sub['countries'] =  this.logService.getCountrys().subscribe(countries => {
      this.countries = countries;
      console.log(countries);
    });
  }

  filter(){
    if (!this.toDate || !this.fromDate) {
      alert('To date / from date is requried');
      return;
    }

    if (this.toDate && this.fromDate && this.toDate < this.fromDate) {
      alert('To date cannot be before from date');
      return;
    }
    this.sub['data'] = this.logService.filterLogs(this.fromDate,this.toDate,this.selectedCountry,this.selectedUser).subscribe(result => {
      this.data = result.data;
      if(result.data.length == 0){
        alert('No results');
      }
    });
  }
  ngOnDestroy() {
    this.sub['users'].unsubscribe();
    this.sub['countries'].unsubscribe();
    this.sub['data'].unsubscribe();
  }
}
