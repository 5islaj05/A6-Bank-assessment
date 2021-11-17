/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.solent.ood.cardcheck;

import org.junit.Test;
import static org.junit.Assert.*;
import org.solent.ood.cardcheck.CalculateLunnDigit;
import static org.solent.ood.cardcheck.TestRegexCardValidator.VALID_VISA_1;

/**
 *
 * @author cgallen
 */
public class CheckCalculateLunnTest {
    

    @Test
    public void checkCalculateLunn() {
        
        String pan =  "550000555555555"; // correct mastercard 5500005555555559

        String check = CalculateLunnDigit.calculateCheckDigit(pan);
        
        String ccNumber = pan+check;
        
        CardValidationResult result = RegexCardValidator.isValid(ccNumber);
        
        System.out.println("pan:"+pan
                + " ccNumber with check digit:"+ ccNumber);

        assertTrue(result.isValid());
                
    }
}
