import 'package:flutter/material.dart';
import 'package:wether_api/domain/api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.data,
  });

  final Weather data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();

  Weather? weather;
  @override
  void initState() {
    weather = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // weather = widget.data;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 239, 239),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Search Your City',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        weather = await Getweather.getcityweather(
                            city: textEditingController.text);
                        setState(() {});
                      },
                      child: const Text('Get weather')),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    weather!.city,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 190, 227, 41)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    weather!.temp.toString(),
                                    style: const TextStyle(
                                        fontSize: 39,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 3,
                                child: Image.asset('asset/image/1779940.png',
                                    fit: BoxFit.fill),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.water_rounded),
                                Text(
                                  widget.data.humidity.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.water_rounded),
                                Text(
                                  widget.data.speed.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 200,
                          child: Column(
                            children: [
                              const Spacer(),
                              const Text(
                                'Preciption',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.data.pressure.toString(),
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Text(
                                'Humidity',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.data.humidity.toString(),
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const Spacer(),
                              const Text(
                                'Wind',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.data.clouds.toString(),
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Text(
                                'Presure',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.data.pressure.toString(),
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
