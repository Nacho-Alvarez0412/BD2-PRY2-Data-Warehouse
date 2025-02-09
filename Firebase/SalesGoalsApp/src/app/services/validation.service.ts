import { Injectable } from '@angular/core';

import { SalesGoal } from '../models/SalesGoal';
import { ValidationError } from '../models/ValidationError';

@Injectable({
  providedIn: 'root',
})
export class ValidationService {
  constructor() {}

  /**
   * Validates sales goal data
   * @param salesGoal The sales goal data that is going to be validated
   */
  public validateSalesGoal(salesGoal: SalesGoal): ValidationError[] {
    let errors: ValidationError[] = [];
    // Check for valid year
    if (salesGoal.year <= 0 || salesGoal.year === null) {
      errors.push({ message: 'Please enter a valid year', field: 'year' });
    }
    // Check for valid month
    if (
      salesGoal.month <= 0 ||
      salesGoal.month > 12 ||
      salesGoal.month === null
    ) {
      errors.push({ message: 'Please enter a valid month', field: 'month' });
    }
    // Check for valid brand code
    if (salesGoal.brand === '') {
      errors.push({
        message: 'Please enter a valid brand name',
        field: 'brand',
      });
    }
    // Check for valid seller
    if (salesGoal.seller === null) {
      errors.push({
        message: 'Please enter a valid seller code',
        field: 'seller',
      });
    }
    // Check for valid amount
    if (salesGoal.amount <= 0 || salesGoal.amount === null) {
      errors.push({
        message: 'Please enter a valid amount',
        field: 'amount',
      });
    }
    return errors;
  }
}
