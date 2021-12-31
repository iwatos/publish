```java
public String[] makeUppercaseArray() {
        final int BEGIN_OF_UPPERCASE = 65;
        final int UPPERCASE_NUM = 26;
        String[] uppercaseArray = new String[UPPERCASE_NUM];
        for(int i = 0; i < UPPERCASE_NUM; i++){
            uppercaseArray[i] = String.valueOf((char)(BEGIN_OF_UPPERCASE + i));
        }
        return uppercaseArray;
    }
```

---
# Related Notes
- 

# References
- 

# Tags
- #java 