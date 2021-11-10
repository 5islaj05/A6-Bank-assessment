<form action="./home.jsp" method="post">
    <div class="container">
        <div class="row">
            <div class="col">
                 <h1>Enter payer's details</h1>
                 <h3>From Card</h3>
                 <label for="fname">Name:</label><br>
                <input type="text" name="name1" value="test user1"><br>
                <label for="lname">End date:</label><br>
                <input type="text" name="endDate1" value="11/21"><br>
                <label for="lname">Card Number:</label><br>
                <input type="text" name="cardnumber1" value="5133880000000012"><br>
                <label for="fname">CVV:</label><br>
                <input type="text" name="cvv1" value="123"><br>
                <label for="lname">Issuer Name:</label><br>
                <input type="text" name="issueNumber1" value="01"><br>
            </div>


            <div class="col">
                 <h1>Enter payee's details</h1>
                 <h3>To Card</h3>
                 <label for="fname">Name:</label><br>
                <input type="text" name="name2" value="test user2"><br>
                <label for="lname">End date:</label><br>
                <input type="text" name="endDate2" value="11/21"><br>
                <label for="lname">Card Number:</label><br>
                <input type="text" name="cardnumber2" value="4285860000000021"><br>
                <label for="fname">CVV:</label><br>
                <input type="text" name="cvv2" value="123"><br>
                <label for="lname">Issuer Name:</label><br>
                <input type="text" name="issueNumber2" value="01"><br>
            </div>

        </div>

        <div class="amount">
            <h3>Amount:</h3>
            <input type="number" name="amount" value=50><br><br>
            <input type="hidden" name="action" value="transaction">
            <input type="submit" value="Submit">
        </div>

    </div>
</form>