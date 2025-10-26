Set<Integer> myList = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> myList2 = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> myList3 = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> myList4 = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> myList5 = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> myList6 = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> listAllIn = new Set<Integer>{ 3, 98 };
set<Integer> listInAndOut = new Set<Integer>{ 1, 3, 99 };
set<Integer> listAllOut = new Set<Integer>{ 87, 134 };
Set<Integer> listCopy = new Set<Integer>{ 1, 3, 5, 98 };
Set<Integer> listCopyPlusExtra = new Set<Integer>{ 1, 3, 5, 98, 9 };

System.debug('retainsAll List ALL IN :::: ' + mylist.retainAll(listAllIn));
System.debug(
  'retainsAll List IN AND OUT :::: ' + mylist2.retainAll(listInAndOut)
);
System.debug('retainsAll List ALL OUT :::: ' + mylist3.retainAll(listAllOut));
System.debug('retainsAll List COPY :::: ' + mylist4.retainAll(listCopy));
System.debug(
  'retainsAll List COPY+  :::: ' + mylist5.retainAll(listCopyPlusExtra)
);
System.debug(
  'retainsAll List COPY+  :::: ' + listCopyPlusExtra.retainAll(mylist6)
);
