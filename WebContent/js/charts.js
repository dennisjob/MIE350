$(document).ready(function () {
    var tcomp = document.getElementById('topCompanies').getContext('2d');
    var topC = new Chart(tcomp, {
        type: 'horizontalBar',
        data: {
            labels: ['Deloitte', 'BMO', 'RBC', 'Google', 'ZS'],
            datasets: [{
                label: 'Number of Applications',
                data: [6, 2, 9, 2, 1],
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var appsByInd = document.getElementById('appsByInd').getContext('2d');
    var ind = new Chart(appsByInd, {
        type: 'doughnut',
        data: {
            labels: ['Consulting', 'Data Analytics', 'Software Engineering', 'Banking', 'Engineering'],
            datasets: [{
                label: 'Number of Applications',
                data: [12, 14, 5, 3, 3],
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        }
    });

    var intByInd = document.getElementById('intByInd').getContext('2d');
    var int = new Chart(intByInd, {
        type: 'doughnut',
        data: {
            labels: ['Consulting', 'Data Analytics', 'Software Engineering', 'Banking', 'Engineering'],
            datasets: [{
                label: 'Number of Interviews',
                data: [1, 4, 1, 2, 5],
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        }
    });  
});

