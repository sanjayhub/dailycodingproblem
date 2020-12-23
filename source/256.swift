/*
Daily Coding Problem: Problem #256 [Medium]

This problem was asked by Fitbit.

Given a linked list, rearrange the node values such that they appear in alternating low -> high -> low -> high ... form. For example, given 1 -> 2 -> 3 -> 4 -> 5, you should return 1 -> 3 -> 2 -> 5 -> 4.

https://leetcode.com/problems/reorder-list/

solution : 
convert list to array and sort and swap like below 

    for i in range(2, len(arr), 2):
        tmp = arr[i]
        arr[i] = arr[i-1]
        arr[i-1] = tmp
*/


 func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return
        }
        
        var prev: ListNode?
        var slow = head, fast = head, l1 = head
        while fast != nil && fast!.next != nil {
           prev = slow
           slow = slow!.next
           fast = fast!.next!.next
        }
        prev?.next = nil
        
    var l2:ListNode? = reverse(slow)
        merge(l1,l2)
        
    }
    
     func merge(_ head1: ListNode?, _ head2: ListNode?) {
        var head1 = head1, head2 = head2
         while head2 != nil {
            var next = head1?.next
            head1?.next = head2
            head1 = head2
            head2 = next
        }
    }
    func reverse(_ head: ListNode?) -> ListNode? {
      if head == nil || head?.next == nil {
        return head
    } 
    var node = head
    var nodePrev: ListNode?
    
    while node != nil {
        let nodeNext = node?.next
        node?.next = nodePrev
        nodePrev = node
        node = nodeNext
    }
    return nodePrev
    }