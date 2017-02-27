import lombok.val;

import java.io.*;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Igor Gnes on 27.02.17.
 */
public class Single {

    public static void main(String[] args) {

        final val single = new Single();
        single.sumUnicode();

    }

    public void sumUnicode() {

        List<String> list = new LinkedList<>();
        list.add("Itea");
        list.add("Java");
        final String collect = list.stream().collect(Collectors.joining());
        System.out.println(collect);

        final char[] chars = collect.toCharArray();

        int result = 0;
        for (int i = 0; i < chars.length; i++) {
            result += Character.codePointAt(chars, i);
        }
        System.out.println(result);


        final Integer value = list.stream().flatMap(s -> s.chars().boxed()).reduce((s, a) -> s + a).orElse(-1);
        System.out.println(value);

    }
}
