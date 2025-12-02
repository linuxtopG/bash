#!/bin/bash

# آلة حاسبة بسيطة بلغة Bash
echo "آلة حاسبة بلغة Bash"
echo "=================="

while true; do
    echo ""
    echo "العمليات المتاحة:"
    echo "+ : جمع"
    echo "- : طرح"
    echo "* : ضرب"
    echo "/ : قسمة"
    echo "q : خروج"
    echo ""

    read -p "أدخل العملية (+, -, *, /) أو q للخروج: " op

    if [[ "$op" == "q" ]]; then
        echo "شكراً لاستخدامك الآلة الحاسبة!"
        exit 0
    fi

    if [[ "$op" != "+" && "$op" != "-" && "$op" != "*" && "$op" != "/" ]]; then
        echo "عملية غير صحيحة!"
        continue
    fi

    read -p "أدخل الرقم الأول: " num1
    read -p "أدخل الرقم الثاني: " num2

    # التحقق من أن المدخلات أرقام
    if ! [[ "$num1" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || ! [[ "$num2" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        echo "خطأ: الرجاء إدخال أرقام صحيحة!"
        continue
    fi

    case $op in
        "+")
            result=$(echo "$num1 + $num2" | bc -l)
            ;;
        "-")
            result=$(echo "$num1 - $num2" | bc -l)
            ;;
        "*")
            result=$(echo "$num1 * $num2" | bc -l)
            ;;
        "/")
            if [[ $(echo "$num2 == 0" | bc -l) -eq 1 ]]; then
                echo "خطأ: لا يمكن القسمة على صفر!"
                continue
            fi
            result=$(echo "$num1 / $num2" | bc -l)
            ;;
    esac

    echo "النتيجة: $num1 $op $num2 = $result"
done
