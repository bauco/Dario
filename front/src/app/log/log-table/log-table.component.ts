import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-log-table',
  templateUrl: './log-table.component.html',
  styleUrls: ['./log-table.component.scss']
})
export class LogTableComponent {
  @Input() data: any;
  displayedColumns = ['log_date', 'success_count', 'failed_count'];
}
