//
//  main.cpp
//  123456
//
//  Created by Andrii Zozulych on 28.11.2021.
//

#include <iostream>
#include <cmath>

bool ifGol(char a){
    if (a=='a' or a=='e' or a=='i' or a=='o' or a=='u' or a=='y'){
        return true;
    }
    return false;
}

int main(int argc, const char * argv[]) {
    int n;
    std::cin>>n;
    std::string str;
    std::string newStr = "";
    std::cin>>str;
    for (int i{0}; i<str.size(); ++i) {
        if (ifGol(str[i])==true and ifGol(str[i+1])==true) {
            i++;
        } else{
            newStr+=str[i];
            newStr+=str[i+1];
        }
    }
    std::cout<<newStr;
}
