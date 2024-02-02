# Project_SIO_1

### About the project
This project is focused on the existence of vulnerabilities in software projects, their exploration and avoidance <br>
In this particular case, the vulnerabilities explored are:
* [CWE-20](https://cwe.mitre.org/data/definitions/20.html): Improper Input Validation
* [CWE-79](https://cwe.mitre.org/data/definitions/79.html): Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting') - **Stored XSS**
* [CWE-89](https://cwe.mitre.org/data/definitions/89.html): Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
* [CWE-328](https://cwe.mitre.org/data/definitions/328.html): Use of Weak Hash
* [CWE-759](https://cwe.mitre.org/data/definitions/759.html): Use of a One-Way Hash without a Salt

The final result is two distinct implementations of a movie review web application. The first version is not secure and encapsulates the identified vulnerabilities, the second version is secure and sucessfully avoids them through implementation measures


### Detailed description/usage
Read the project report -> [**SIO_P1_G06.pdf**](/doc/SIO_P1_G06.pdf) <br>
Insecure application, including instructions to run it -> [app_notSec](app/app_notSec)  <br>
Secure application, including instructions to run it -> [app_sec](app/app_sec)  <br>
