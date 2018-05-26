using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Demo
{
    class Program
    {
        static void Main(string[] args)
        {
            //TaskAction();
            ParallelForEachVsForEach();

            Console.ReadKey();
        }

        static void TaskAction()
        {
            Action calcAct = () =>
            {
                for (int i = 0; i < 4; i++)
                {
                    //Console.WriteLine($"Calc action {i}");
                }
            };

            Action waitAct = () =>
            {
                Thread.Sleep(4000);
            };

            Action<Action> measure = (body) =>
            {
                var startTime = DateTime.Now;
                body();
                Console.WriteLine($"{DateTime.Now - startTime} - Thread-ID: {Thread.CurrentThread.ManagedThreadId}");
            };

            //measure(() =>
            //{
            //    var tasks = Enumerable.Range(1, 10)
            //                          .Select(_ => Task.Factory.StartNew(() => measure(waitAct)))
            //                          .ToArray();
            //    Console.WriteLine("Task");
            //    //var tasks = new[]
            //    //{
            //    //    Task.Factory.StartNew(() => measure(calcAct)),
            //    //    Task.Factory.StartNew(() => measure(calcAct)),
            //    //    Task.Factory.StartNew(() => measure(calcAct)),
            //    //    Task.Factory.StartNew(() => measure(calcAct)),
            //    //    Task.Factory.StartNew(() => measure(calcAct)),
            //    //    Task.Factory.StartNew(() => measure(calcAct))
            //    //};
            //    Task.WaitAll(tasks);
            //});

            ThreadPool.SetMinThreads(10, 10);
            //Parallel.For(0, 10, _ =>
            //{
            //    Console.WriteLine("Parallel");
            //    measure(waitAct);
            //});

            //ParallelEnumerable.Range(1, 10)
            //                  .WithDegreeOfParallelism(5)
            //                  .ForAll(_ =>
            //                  {
            //                      Console.WriteLine("Parallel");
            //                      measure(waitAct);
            //                  });

            var queue = new Queue<int>();

            var produsers = Enumerable.Range(0, 4)
                                      .Select(_ => Task.Factory.StartNew(() =>
                                      {
                                          Enumerable.Range(0, 100)
                                                    .ToList()
                                                    .ForEach(i =>
                                                    {
                                                        queue.Enqueue(i);
                                                        Console.WriteLine(queue.Dequeue());
                                                        Thread.Sleep(400);
                                                    });
                                      }));


            Console.WriteLine("Press any key to continue ...");
            Console.ReadKey();
        }

        static void ParallelForEachVsForEach()
        {
            var names = new string[] {
                "1.mahesh",
                "2.vikram",
                "3.mahesh",
                "4.mayur",
                "5.suprotim",
                "6.saket",
                "7.a-ken",
                "8.manish"
            };

            Console.ResetColor();
            Console.WriteLine("Parallel ForEach()__________________________________________________________");
            var sw = Stopwatch.StartNew();
            Parallel.ForEach<string>(names, name =>
            {
                Console.WriteLine($"Name: {name}, Thread ID: {Thread.CurrentThread.ManagedThreadId}, Thread State: {Thread.CurrentThread.ThreadState}");
                //Thread.Sleep(100);
            });
            Console.ForegroundColor = ConsoleColor.DarkRed;
            Console.WriteLine($"Parallel ForEach() executing times = {sw.Elapsed.TotalSeconds}");

            Console.ResetColor();
            Console.WriteLine("\n\nForEach()___________________________________________________________________");
            sw = Stopwatch.StartNew();
            foreach (var name in names)
            {
                Console.WriteLine($"Name: {name}, Thread ID: {Thread.CurrentThread.ManagedThreadId}, Thread State: {Thread.CurrentThread.ThreadState}");
                //Thread.Sleep(100);
            }
            Console.ForegroundColor = ConsoleColor.DarkRed;
            Console.WriteLine($"ForEach() executing times = {sw.Elapsed.TotalSeconds}");

            sw.Stop();
        }
    }
}
