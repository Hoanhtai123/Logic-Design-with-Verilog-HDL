module t_main(password,
result,
data_test,
mode_test,
reset_test,
enable_t,
signal_t,
clock_t,
password2,
clock3,
trials);
input mode_test,reset_test,clock_t;
input [3:0]data_test;
output[11:0] password; //ng dung nhap
output enable_t,signal_t;
output clock3;
output[1:0] result, trials;
output[11:0] password2; //pass dung' de verify
wire [6:0] t_h0, t_h1, t_h2;

fsm_pwdinput _fsm_pwdinput(data_test,clock_t,password,clock3,t_h0,t_h1,t_h2);

verify _verify(mode_test, password2, password, enable_t, clock3, signal_t, result,trials);

block _block(reset_test, signal_t, enable_t);

set_password _set_password (mode_test, password, password2, clock3,enable_t);
//clock_t la key0
// mode_test la key1
// reset la key2
endmodule




