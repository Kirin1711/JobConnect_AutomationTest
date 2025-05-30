using System;
namespace SapXepMang
{
    public class IntArray
    {
        int[] a;
        public IntArray()
        {
        }
        public int TimMin(int vt)
        {
            int vtmin = vt;
            for (int i = vt + 1; i < a.Length; i++)
                if (a[i] < a[vtmin])
                    vtmin = i;
            return vtmin;
        }
        public void HoanVi(ref int a, ref int b)
        {
            int tam = a;
            a = b;
            b = tam;
        }
        public void SelectionSort()
        {
            for(int i=0; i<a.Length-1; i++)
            {
                int vtmin = TimMin(i);
                HoanVi(ref a[i], ref a[vtmin]);
            }
        }
        public void Bubble()
        {
            for(int i=0; i<a.Length-1; i++)
            {
                for (int j = a.Length - 1; j > i; j--)
                    if (a[j - 1] > a[j])
                        HoanVi(ref a[j - 1], ref a[j]);
            }
        }
    }
}
